import 'dart:async';

import 'package:mobile_software_engineer/core/core.dart';

abstract interface class ClientInterceptor {
  FutureOr<RestClientHttpMessage> onResponse(RestClientResponse response);
  FutureOr<RestClientHttpMessage> onRequest(RestClientRequest request);
  FutureOr<RestClientHttpMessage> onError(RestClientException error);
}
