import 'package:equatable/equatable.dart';

/// Base exception of the application.
///
class BaseException extends Equatable implements Exception {
  final String code;
  final String message;

  const BaseException(this.code, this.message);

  // coverage:ignore-start
  @override
  List<Object?> get props => [code, message];
  // coverage:ignore-end
}
