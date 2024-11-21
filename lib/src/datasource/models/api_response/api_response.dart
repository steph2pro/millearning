import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<R, E> with _$ApiResponse<R, E> {
  const factory ApiResponse.success(R response) = _ApiResponseSuccess;
  const factory ApiResponse.error(E error) = _ApiResponseError;
}

enum ApiErrorType {
  /// Something went wrong on the server side
  server,

  /// Something's wrong with the network request
  network,

  /// User did something wrong
  user,

  /// The error is unidentified
  unknown,
}

class ApiError<T> extends Equatable {
  final ApiErrorType type;
  final int? statusCode;
  final T? error;
  final String? message;

  const ApiError({
    required this.type,
    this.statusCode,
    this.error,
    this.message,
  });

  /// Helper to create a server-side error
  factory ApiError.server({T? error, int? statusCode, String? message}) {
    return ApiError(
      type: ApiErrorType.server,
      error: error,
      statusCode: statusCode,
      message: message ?? 'Server error occurred',
    );
  }

  /// Helper to create a network error
  factory ApiError.network({T? error, String? message}) {
    return ApiError(
      type: ApiErrorType.network,
      error: error,
      message: message ?? 'Network error occurred',
    );
  }

  /// Helper to create a user-side error
  factory ApiError.user({T? error, String? message}) {
    return ApiError(
      type: ApiErrorType.user,
      error: error,
      message: message ?? 'User error occurred',
    );
  }

  /// Helper to create an unknown error
  factory ApiError.unknown({T? error, String? message}) {
    return ApiError(
      type: ApiErrorType.unknown,
      error: error,
      message: message ?? 'An unknown error occurred',
    );
  }

  @override
  List<Object?> get props => [type, statusCode, error, message];

  @override
  String toString() {
    return 'ApiError(type: $type, statusCode: $statusCode, error: $error, message: $message)';
  }
}
