import 'dart:async';

import 'package:mobile_software_engineer/core/core.dart';

class UserAgentInterceptor implements ClientInterceptor {
  final String userAgent;

  UserAgentInterceptor({required this.userAgent});

  @override
  FutureOr<RestClientHttpMessage> onError(RestClientException error) {
    return error;
  }

  @override
  FutureOr<RestClientHttpMessage> onResponse(RestClientResponse response) {
    return response;
  }

  @override
  FutureOr<RestClientHttpMessage> onRequest(RestClientRequest request) {
    request.headers?['User-Agent'] = userAgent;

    return request;
  }
}
