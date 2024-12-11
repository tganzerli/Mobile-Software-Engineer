import 'dart:async';
import 'dart:developer' as dev;

import 'package:mobile_software_engineer/core/core.dart';

class LogsInterceptor implements ClientInterceptor {
  @override
  FutureOr<RestClientHttpMessage> onError(RestClientException error) {
    String? message = error.message;
    StackTrace? stackTrace = error.stackTracing;
    String path = error.response?.request.path ?? '';
    String url = error.response?.request.baseUrl ?? '';
    //TODO: verificar tipagem do error.error, ele não é do tipo Exception
    // Exception exception = error.error;
    dynamic data = error.data;
    int? statusCode = error.statusCode;

    dev.log(LogColors.red("----------> INIT APP ERROR <----------"));
    dev.log("$url$path", name: 'Error');
    dev.log("STATUS CODE => $statusCode", name: 'Error');
    dev.log("MESSAGE => $message", name: 'Error');
    //dev.log("EXCEPTION => $exception", name: 'Error');
    dev.log("STACKTRACE => $stackTrace", name: 'Error');
    dev.log("DATA => $data", name: 'Error');
    dev.log(LogColors.red("----------> END APP ERROR <----------"));

    return error;
  }

  @override
  FutureOr<RestClientHttpMessage> onRequest(RestClientRequest request) {
    dynamic body = request.data;
    Map headers = request.headers ?? {};
    String path = request.path;
    String url = request.baseUrl;
    String method = request.method.toString();

    dev.log(LogColors.cyan("----------> INIT APP REQUEST <----------"));
    dev.log("$method => $url$path", name: 'Request');
    dev.log("HEADERS => $headers", name: 'Request');
    dev.log("BODY => $body", name: 'Request');
    dev.log(LogColors.cyan("----------> END APP REQUEST <----------"));

    return request;
  }

  @override
  FutureOr<RestClientHttpMessage> onResponse(RestClientResponse response) {
    dynamic body = response.data;
    Map headers = response.request.headers ?? {};
    String path = response.request.path;
    String url = response.request.baseUrl;
    int? statusCode = response.statusCode;

    dev.log(LogColors.brightGreen("----------> INIT APP RESPONSE <----------"));
    dev.log("$url$path", name: 'Response');
    dev.log("STATUS CODE => $statusCode", name: 'Response');
    dev.log("HEADERS => $headers", name: 'Response');
    dev.log("BODY => $body", name: 'Response');
    dev.log(LogColors.brightGreen("----------> END APP RESPONSE <----------"));

    return response;
  }
}
