import 'rest_client_interceptor.dart';
import 'rest_client_multipart.dart';
import 'rest_client_request.dart';
import 'rest_client_response.dart';

abstract interface class RestClient {
  Future<RestClientResponse> request(RestClientRequest request);

  Future<RestClientResponse> upload(RestClientMultipart multipart);

  void setBaseUrl(String url);

  void cleanHeaders();

  void setHeaders(Map<String, dynamic> header);

  void addInterceptors(ClientInterceptor interceptor);

  void removeInterceptors(ClientInterceptor interceptor);
}
