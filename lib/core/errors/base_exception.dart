abstract class BaseException implements Exception {
  const BaseException({
    required this.message,
    this.statusCode,
    this.stackTracing,
  });

  final String message;
  final int? statusCode;  
  final dynamic stackTracing;
}
