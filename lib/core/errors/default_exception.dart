import 'base_exception.dart';

class DefaultException extends BaseException {
  const DefaultException({
    required super.message,
    super.stackTracing,
  });
}

class ValidationException extends BaseException {
  const ValidationException({
    required super.message,
    super.stackTracing,
  });
}

class UnauthorizedException extends BaseException {
  const UnauthorizedException({
    required super.message,
    super.stackTracing,
  });
}
