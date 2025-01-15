// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cv_preview_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CvPreviewResponse _$CvPreviewResponseFromJson(Map<String, dynamic> json) {
  return _CvPreviewResponse.fromJson(json);
}

/// @nodoc
mixin _$CvPreviewResponse {
  String get message => throw _privateConstructorUsedError;
  CvPreviewModel? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this CvPreviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CvPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CvPreviewResponseCopyWith<CvPreviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CvPreviewResponseCopyWith<$Res> {
  factory $CvPreviewResponseCopyWith(
          CvPreviewResponse value, $Res Function(CvPreviewResponse) then) =
      _$CvPreviewResponseCopyWithImpl<$Res, CvPreviewResponse>;
  @useResult
  $Res call({String message, CvPreviewModel? data, String? error});

  $CvPreviewModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$CvPreviewResponseCopyWithImpl<$Res, $Val extends CvPreviewResponse>
    implements $CvPreviewResponseCopyWith<$Res> {
  _$CvPreviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CvPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CvPreviewModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CvPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CvPreviewModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CvPreviewModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CvPreviewResponseImplCopyWith<$Res>
    implements $CvPreviewResponseCopyWith<$Res> {
  factory _$$CvPreviewResponseImplCopyWith(_$CvPreviewResponseImpl value,
          $Res Function(_$CvPreviewResponseImpl) then) =
      __$$CvPreviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CvPreviewModel? data, String? error});

  @override
  $CvPreviewModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CvPreviewResponseImplCopyWithImpl<$Res>
    extends _$CvPreviewResponseCopyWithImpl<$Res, _$CvPreviewResponseImpl>
    implements _$$CvPreviewResponseImplCopyWith<$Res> {
  __$$CvPreviewResponseImplCopyWithImpl(_$CvPreviewResponseImpl _value,
      $Res Function(_$CvPreviewResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$CvPreviewResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CvPreviewModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CvPreviewResponseImpl implements _CvPreviewResponse {
  _$CvPreviewResponseImpl({required this.message, this.data, this.error});

  factory _$CvPreviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CvPreviewResponseImplFromJson(json);

  @override
  final String message;
  @override
  final CvPreviewModel? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'CvPreviewResponse(message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CvPreviewResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, error);

  /// Create a copy of CvPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CvPreviewResponseImplCopyWith<_$CvPreviewResponseImpl> get copyWith =>
      __$$CvPreviewResponseImplCopyWithImpl<_$CvPreviewResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CvPreviewResponseImplToJson(
      this,
    );
  }
}

abstract class _CvPreviewResponse implements CvPreviewResponse {
  factory _CvPreviewResponse(
      {required final String message,
      final CvPreviewModel? data,
      final String? error}) = _$CvPreviewResponseImpl;

  factory _CvPreviewResponse.fromJson(Map<String, dynamic> json) =
      _$CvPreviewResponseImpl.fromJson;

  @override
  String get message;
  @override
  CvPreviewModel? get data;
  @override
  String? get error;

  /// Create a copy of CvPreviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CvPreviewResponseImplCopyWith<_$CvPreviewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
