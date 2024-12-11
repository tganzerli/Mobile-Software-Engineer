// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'rest_client_http_message.dart';

class RestClientRequest implements RestClientHttpMessage {
  final String path;
  final RestMethod method;
  final dynamic data;
  final String baseUrl;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final Duration? sendTimeout;
  final Duration? receiveTimeout;
  RestClientRequest({
    required this.path,
    required this.method,
    this.data,
    this.baseUrl = '',
    this.queryParameters,
    this.headers,
    this.sendTimeout,
    this.receiveTimeout,
  });

  RestClientRequest copyWith({
    String? path,
    RestMethod? method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) {
    return RestClientRequest(
      path: path ?? this.path,
      method: method ?? this.method,
      data: data ?? this.data,
      queryParameters: queryParameters ?? this.queryParameters,
      headers: headers ?? this.headers,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
    );
  }
}

enum RestMethod {
  delete('DELETE'),
  get('GET'),
  patch('PATCH'),
  post('POST'),
  put('PUT');

  final String method;

  const RestMethod(this.method);

  @override
  String toString() => method;

  static RestMethod fromString(String method) {
    return switch (method) {
      'DELETE' => RestMethod.delete,
      'GET' => RestMethod.get,
      'PATCH' => RestMethod.patch,
      'POST' => RestMethod.post,
      'PUT' => RestMethod.put,
      _ => RestMethod.get,
    };
  }
}
