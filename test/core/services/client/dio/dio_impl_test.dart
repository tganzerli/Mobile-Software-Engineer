import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_software_engineer/core/core.dart';
import 'package:mobile_software_engineer/core/services/client/dio/dio_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements DioForNative {}

class MockOptions extends Mock implements BaseOptions {
  @override
  final Map<String, dynamic> headers = {'User-Agent': 'version'};
}

void main() {
  late MockDio mockDio;
  late RestClient restClient;

  setUp(
    () {
      mockDio = MockDio();
      restClient = RestClientDioImpl(
        dio: mockDio,
      );

      when(() => mockDio.options).thenReturn(MockOptions());
    },
  );

  void mockDioResponse({
    required Future<Response> Function() dioMethod,
    required Future<Response> Function() response,
  }) {
    when(dioMethod).thenAnswer((_) => response());
  }

  void mockDioException({
    required Future<Response> Function() dioMethod,
    required DioException exception,
  }) {
    when(dioMethod).thenThrow(exception);
  }

  group('GET requests', () {
    test('should get with success', () async {
      mockDioResponse(
        dioMethod: () => mockDio.get(
          '',
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
        response: () async => Response(
          data: 'test',
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
        ),
      );

      final result = await restClient
          .request(RestClientRequest(path: '', method: RestMethod.get));
      expect(result.statusCode, 200);
      expect(result.data, 'test');
    });

    test('should get with exception', () async {
      final request = RequestOptions(baseUrl: '');

      mockDioException(
        dioMethod: () => mockDio.get(
          '',
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
        exception: DioException(
          requestOptions: request,
          response: Response(
            requestOptions: request,
            statusCode: 404,
            statusMessage: 'Error',
          ),
        ),
      );

      try {
        await restClient
            .request(RestClientRequest(path: '', method: RestMethod.get));
      } on RestClientException catch (e) {
        expect(e.statusCode, 404);
      }
    });
  });

  group('POST requests', () {
    test('should post with success', () async {
      mockDioResponse(
        dioMethod: () => mockDio.post(
          '',
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
        response: () async => Response(
          data: 'test',
          requestOptions: RequestOptions(path: ''),
          statusCode: 201,
        ),
      );

      final result = await restClient.request(
        RestClientRequest(
            path: '', method: RestMethod.post, data: {'key': 'value'}),
      );
      expect(result.statusCode, 201);
      expect(result.data, 'test');
    });

    test('should post with exception', () async {
      final request = RequestOptions(baseUrl: '');

      mockDioException(
        dioMethod: () => mockDio.post(
          '',
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
        exception: DioException(
          requestOptions: request,
          response: Response(
            requestOptions: request,
            statusCode: 400,
            statusMessage: 'Error',
          ),
        ),
      );

      try {
        await restClient.request(RestClientRequest(
            path: '', method: RestMethod.post, data: {'key': 'value'}));
      } on RestClientException catch (e) {
        expect(e.statusCode, 400);
      }
    });
  });

  group('PUT requests', () {
    test('should put with success', () async {
      mockDioResponse(
        dioMethod: () => mockDio.put(
          '',
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
        response: () async => Response(
          data: 'test',
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
        ),
      );

      final result = await restClient.request(
        RestClientRequest(
            path: '', method: RestMethod.put, data: {'key': 'value'}),
      );
      expect(result.statusCode, 200);
      expect(result.data, 'test');
    });

    test('should put with exception', () async {
      final request = RequestOptions(baseUrl: '');

      mockDioException(
        dioMethod: () => mockDio.put(
          '',
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
        exception: DioException(
          requestOptions: request,
          response: Response(
            requestOptions: request,
            statusCode: 400,
            statusMessage: 'Error',
          ),
        ),
      );

      try {
        await restClient.request(RestClientRequest(
            path: '', method: RestMethod.put, data: {'key': 'value'}));
      } on RestClientException catch (e) {
        expect(e.statusCode, 400);
      }
    });
  });

  group('DELETE requests', () {
    test('should delete with success', () async {
      mockDioResponse(
        dioMethod: () => mockDio.delete(
          '',
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
        response: () async => Response(
          data: 'test',
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
        ),
      );

      final result = await restClient
          .request(RestClientRequest(path: '', method: RestMethod.delete));
      expect(result.statusCode, 200);
      expect(result.data, 'test');
    });

    test('should delete with exception', () async {
      final request = RequestOptions(baseUrl: '');

      mockDioException(
        dioMethod: () => mockDio.delete(
          '',
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
        exception: DioException(
          requestOptions: request,
          response: Response(
            requestOptions: request,
            statusCode: 400,
            statusMessage: 'Error',
          ),
        ),
      );

      try {
        await restClient
            .request(RestClientRequest(path: '', method: RestMethod.delete));
      } on RestClientException catch (e) {
        expect(e.statusCode, 400);
      }
    });
  });
}
