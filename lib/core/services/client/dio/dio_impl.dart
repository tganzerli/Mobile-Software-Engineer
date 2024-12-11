import 'package:mobile_software_engineer/core/core.dart';
import 'package:dio/dio.dart';

import 'dio_interceptor_impl.dart';
import 'dio_adapter.dart';

class DioFactory {
  static Dio dio() {
    final Map<String, dynamic> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Charset': 'utf-8',
    };
    final baseOptions = BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(
          milliseconds:
              int.fromEnvironment('CONNECT_TIMEOUT', defaultValue: 5000)),
      receiveTimeout: const Duration(
          milliseconds:
              int.fromEnvironment('RECEIVE_TIMEOUT', defaultValue: 5000)),
      headers: headers,
    );
    return Dio(baseOptions);
  }
}

class RestClientDioImpl implements RestClient {
  final Dio _dio;

  final Map<ClientInterceptor, Interceptor> _interceptors = {};

  final Map<String, dynamic> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Charset': 'utf-8',
  };

  RestClientDioImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  void setBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }

  @override
  void cleanHeaders() {
    _dio.options.headers = headers;
  }

  @override
  void setHeaders(Map<String, dynamic> header) {
    _dio.options.headers.addAll(header);
  }

  @override
  void addInterceptors(ClientInterceptor interceptor) {
    _interceptors[interceptor] =
        ClientInterceptorDioImpl(interceptor: interceptor);
    _dio.interceptors.add(_interceptors[interceptor]!);
  }

  @override
  void removeInterceptors(ClientInterceptor interceptor) {
    _dio.interceptors.remove(_interceptors[interceptor]);
    _interceptors.remove(interceptor);
  }

  @override
  Future<RestClientResponse> upload(RestClientMultipart multipart) async {
    final formData = FormData.fromMap({
      multipart.fileKey: MultipartFile.fromBytes(
        multipart.fileBytes ?? [],
        filename: multipart.fileName,
      ),
    });

    final baseOptions = BaseOptions(
      connectTimeout: const Duration(
          milliseconds:
              int.fromEnvironment('CONNECT_TIMEOUT', defaultValue: 5000)),
      receiveTimeout: const Duration(
          milliseconds:
              int.fromEnvironment('RECEIVE_TIMEOUT', defaultValue: 5000)),
    );

    Dio dio = Dio(baseOptions);
    final response = await dio.put(
      multipart.path,
      data: formData,
    );

    return DioAdapter.toClientResponse(response);
  }

  @override
  Future<RestClientResponse> request(RestClientRequest request) {
    return switch (request.method) {
      RestMethod.delete => _delete(request),
      RestMethod.get => _get(request),
      RestMethod.patch => _patch(request),
      RestMethod.post => _post(request),
      RestMethod.put => _put(request),
    };
  }

  Future<RestClientResponse> _delete(RestClientRequest request) async {
    try {
      setBaseUrl(request.baseUrl);
      final response = await _dio.delete(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          method: 'DELETE',
          headers: request.headers,
          sendTimeout: request.sendTimeout,
          receiveTimeout: request.receiveTimeout,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  Future<RestClientResponse> _get(RestClientRequest request) async {
    try {
      setBaseUrl(request.baseUrl);
      final response = await _dio.get(
        request.path,
        queryParameters: request.queryParameters,
        options: Options(
          method: 'GET',
          headers: request.headers,
          sendTimeout: request.sendTimeout,
          receiveTimeout: request.receiveTimeout,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  Future<RestClientResponse> _patch(RestClientRequest request) async {
    try {
      setBaseUrl(request.baseUrl);
      final response = await _dio.patch(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
          sendTimeout: request.sendTimeout,
          receiveTimeout: request.receiveTimeout,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  Future<RestClientResponse> _post(RestClientRequest request) async {
    try {
      setBaseUrl(request.baseUrl);
      final response = await _dio.post(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          method: 'POST',
          headers: request.headers,
          sendTimeout: request.sendTimeout,
          receiveTimeout: request.receiveTimeout,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  Future<RestClientResponse> _put(RestClientRequest request) async {
    try {
      setBaseUrl(request.baseUrl);
      final response = await _dio.put(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          method: 'PUT',
          headers: request.headers,
          sendTimeout: request.sendTimeout,
          receiveTimeout: request.receiveTimeout,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }
}
