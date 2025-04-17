// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:store_app/core/networking/api_error_handler.dart';
// part 'api_result.freezed.dart';

// @freezed
// abstract class ApiResult<T> with _$ApiResult {
//   const factory ApiResult.success(T data) = Success<T>;
//   const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
// }

abstract class ApiResult<T> {
  const ApiResult();
  factory ApiResult.success(T data) = Success<T>;
  factory ApiResult.failure(T error) = Failure<T>;
}

class Success<T> extends ApiResult<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final T error;
  Failure(this.error);
}
