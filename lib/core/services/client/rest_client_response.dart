import 'package:mobile_software_engineer/core/core.dart';

class RestClientResponse implements RestClientHttpMessage {
  dynamic data;
  int? statusCode;
  String? message;
  RestClientRequest request;

  RestClientResponse({
    this.data,
    this.statusCode,
    this.message,
    required this.request,
  });
}
