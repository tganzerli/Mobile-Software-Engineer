import 'package:flutter/foundation.dart';

abstract class ViewState {}

abstract class ViewModel<T extends ViewState> implements ValueListenable<T> {
  late final ValueNotifier<T> _stateNotifier;

  T get state => _stateNotifier.value;

  @override
  T get value => _stateNotifier.value;

  ViewModel(T initialState) {
    _stateNotifier = ValueNotifier<T>(initialState);
  }

  @override
  void addListener(VoidCallback listener) {
    _stateNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateNotifier.removeListener(listener);
  }

  @protected
  void emit(T newState) {
    _stateNotifier.value = newState;
  }

  void dispose() {
    _stateNotifier.dispose();
  }
}
