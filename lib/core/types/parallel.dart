import 'dart:async';
import 'dart:isolate';

class Parallel<T> {
  final List<Function> _functions;

  Parallel(this._functions);

  Future<List<T>> run() async {
    final results = <T>[];
    final receivePort = ReceivePort();

    final futures = _functions.map((func) {
      return Isolate.spawn<_IsolateData>(
        _isolateEntryPoint,
        _IsolateData(func, receivePort.sendPort),
      );
    }).toList();

    await Future.wait(futures);

    await for (var message in receivePort) {
      results.add(message as T);
      if (results.length == _functions.length) {
        receivePort.close();
      }
    }

    return results;
  }

  static void _isolateEntryPoint<T>(_IsolateData data) {
    final result = data.function();
    data.sendPort.send(result);
  }
}

class _IsolateData {
  final Function function;
  final SendPort sendPort;

  _IsolateData(this.function, this.sendPort);
}
