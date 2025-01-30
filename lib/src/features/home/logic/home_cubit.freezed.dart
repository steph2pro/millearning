// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiError<dynamic> error) error,
    required TResult Function(CategoryResponse response) successGetCategories,
    required TResult Function(ProfessionResponse response)
        successGetProfessions,
    required TResult Function(VideoResponse response) successGetVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiError<dynamic> error)? error,
    TResult? Function(CategoryResponse response)? successGetCategories,
    TResult? Function(ProfessionResponse response)? successGetProfessions,
    TResult? Function(VideoResponse response)? successGetVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiError<dynamic> error)? error,
    TResult Function(CategoryResponse response)? successGetCategories,
    TResult Function(ProfessionResponse response)? successGetProfessions,
    TResult Function(VideoResponse response)? successGetVideos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetCategories value) successGetCategories,
    required TResult Function(_SuccessGetProfessions value)
        successGetProfessions,
    required TResult Function(_SuccessGetVideos value) successGetVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetCategories value)? successGetCategories,
    TResult? Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult? Function(_SuccessGetVideos value)? successGetVideos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetCategories value)? successGetCategories,
    TResult Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult Function(_SuccessGetVideos value)? successGetVideos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiError<dynamic> error) error,
    required TResult Function(CategoryResponse response) successGetCategories,
    required TResult Function(ProfessionResponse response)
        successGetProfessions,
    required TResult Function(VideoResponse response) successGetVideos,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiError<dynamic> error)? error,
    TResult? Function(CategoryResponse response)? successGetCategories,
    TResult? Function(ProfessionResponse response)? successGetProfessions,
    TResult? Function(VideoResponse response)? successGetVideos,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiError<dynamic> error)? error,
    TResult Function(CategoryResponse response)? successGetCategories,
    TResult Function(ProfessionResponse response)? successGetProfessions,
    TResult Function(VideoResponse response)? successGetVideos,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetCategories value) successGetCategories,
    required TResult Function(_SuccessGetProfessions value)
        successGetProfessions,
    required TResult Function(_SuccessGetVideos value) successGetVideos,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetCategories value)? successGetCategories,
    TResult? Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult? Function(_SuccessGetVideos value)? successGetVideos,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetCategories value)? successGetCategories,
    TResult Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult Function(_SuccessGetVideos value)? successGetVideos,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  _$LoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiError<dynamic> error) error,
    required TResult Function(CategoryResponse response) successGetCategories,
    required TResult Function(ProfessionResponse response)
        successGetProfessions,
    required TResult Function(VideoResponse response) successGetVideos,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiError<dynamic> error)? error,
    TResult? Function(CategoryResponse response)? successGetCategories,
    TResult? Function(ProfessionResponse response)? successGetProfessions,
    TResult? Function(VideoResponse response)? successGetVideos,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiError<dynamic> error)? error,
    TResult Function(CategoryResponse response)? successGetCategories,
    TResult Function(ProfessionResponse response)? successGetProfessions,
    TResult Function(VideoResponse response)? successGetVideos,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetCategories value) successGetCategories,
    required TResult Function(_SuccessGetProfessions value)
        successGetProfessions,
    required TResult Function(_SuccessGetVideos value) successGetVideos,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetCategories value)? successGetCategories,
    TResult? Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult? Function(_SuccessGetVideos value)? successGetVideos,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetCategories value)? successGetCategories,
    TResult Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult Function(_SuccessGetVideos value)? successGetVideos,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeState {
  factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiError<dynamic> error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiError<dynamic>,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  _$ErrorImpl({required this.error});

  @override
  final ApiError<dynamic> error;

  @override
  String toString() {
    return 'HomeState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiError<dynamic> error) error,
    required TResult Function(CategoryResponse response) successGetCategories,
    required TResult Function(ProfessionResponse response)
        successGetProfessions,
    required TResult Function(VideoResponse response) successGetVideos,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiError<dynamic> error)? error,
    TResult? Function(CategoryResponse response)? successGetCategories,
    TResult? Function(ProfessionResponse response)? successGetProfessions,
    TResult? Function(VideoResponse response)? successGetVideos,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiError<dynamic> error)? error,
    TResult Function(CategoryResponse response)? successGetCategories,
    TResult Function(ProfessionResponse response)? successGetProfessions,
    TResult Function(VideoResponse response)? successGetVideos,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetCategories value) successGetCategories,
    required TResult Function(_SuccessGetProfessions value)
        successGetProfessions,
    required TResult Function(_SuccessGetVideos value) successGetVideos,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetCategories value)? successGetCategories,
    TResult? Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult? Function(_SuccessGetVideos value)? successGetVideos,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetCategories value)? successGetCategories,
    TResult Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult Function(_SuccessGetVideos value)? successGetVideos,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HomeState {
  factory _Error({required final ApiError<dynamic> error}) = _$ErrorImpl;

  ApiError<dynamic> get error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessGetCategoriesImplCopyWith<$Res> {
  factory _$$SuccessGetCategoriesImplCopyWith(_$SuccessGetCategoriesImpl value,
          $Res Function(_$SuccessGetCategoriesImpl) then) =
      __$$SuccessGetCategoriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryResponse response});

  $CategoryResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$SuccessGetCategoriesImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SuccessGetCategoriesImpl>
    implements _$$SuccessGetCategoriesImplCopyWith<$Res> {
  __$$SuccessGetCategoriesImplCopyWithImpl(_$SuccessGetCategoriesImpl _value,
      $Res Function(_$SuccessGetCategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessGetCategoriesImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as CategoryResponse,
    ));
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryResponseCopyWith<$Res> get response {
    return $CategoryResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$SuccessGetCategoriesImpl implements _SuccessGetCategories {
  _$SuccessGetCategoriesImpl({required this.response});

  @override
  final CategoryResponse response;

  @override
  String toString() {
    return 'HomeState.successGetCategories(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetCategoriesImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetCategoriesImplCopyWith<_$SuccessGetCategoriesImpl>
      get copyWith =>
          __$$SuccessGetCategoriesImplCopyWithImpl<_$SuccessGetCategoriesImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiError<dynamic> error) error,
    required TResult Function(CategoryResponse response) successGetCategories,
    required TResult Function(ProfessionResponse response)
        successGetProfessions,
    required TResult Function(VideoResponse response) successGetVideos,
  }) {
    return successGetCategories(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiError<dynamic> error)? error,
    TResult? Function(CategoryResponse response)? successGetCategories,
    TResult? Function(ProfessionResponse response)? successGetProfessions,
    TResult? Function(VideoResponse response)? successGetVideos,
  }) {
    return successGetCategories?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiError<dynamic> error)? error,
    TResult Function(CategoryResponse response)? successGetCategories,
    TResult Function(ProfessionResponse response)? successGetProfessions,
    TResult Function(VideoResponse response)? successGetVideos,
    required TResult orElse(),
  }) {
    if (successGetCategories != null) {
      return successGetCategories(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetCategories value) successGetCategories,
    required TResult Function(_SuccessGetProfessions value)
        successGetProfessions,
    required TResult Function(_SuccessGetVideos value) successGetVideos,
  }) {
    return successGetCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetCategories value)? successGetCategories,
    TResult? Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult? Function(_SuccessGetVideos value)? successGetVideos,
  }) {
    return successGetCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetCategories value)? successGetCategories,
    TResult Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult Function(_SuccessGetVideos value)? successGetVideos,
    required TResult orElse(),
  }) {
    if (successGetCategories != null) {
      return successGetCategories(this);
    }
    return orElse();
  }
}

abstract class _SuccessGetCategories implements HomeState {
  factory _SuccessGetCategories({required final CategoryResponse response}) =
      _$SuccessGetCategoriesImpl;

  CategoryResponse get response;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessGetCategoriesImplCopyWith<_$SuccessGetCategoriesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessGetProfessionsImplCopyWith<$Res> {
  factory _$$SuccessGetProfessionsImplCopyWith(
          _$SuccessGetProfessionsImpl value,
          $Res Function(_$SuccessGetProfessionsImpl) then) =
      __$$SuccessGetProfessionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfessionResponse response});

  $ProfessionResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$SuccessGetProfessionsImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SuccessGetProfessionsImpl>
    implements _$$SuccessGetProfessionsImplCopyWith<$Res> {
  __$$SuccessGetProfessionsImplCopyWithImpl(_$SuccessGetProfessionsImpl _value,
      $Res Function(_$SuccessGetProfessionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessGetProfessionsImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ProfessionResponse,
    ));
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfessionResponseCopyWith<$Res> get response {
    return $ProfessionResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$SuccessGetProfessionsImpl implements _SuccessGetProfessions {
  _$SuccessGetProfessionsImpl({required this.response});

  @override
  final ProfessionResponse response;

  @override
  String toString() {
    return 'HomeState.successGetProfessions(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetProfessionsImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetProfessionsImplCopyWith<_$SuccessGetProfessionsImpl>
      get copyWith => __$$SuccessGetProfessionsImplCopyWithImpl<
          _$SuccessGetProfessionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiError<dynamic> error) error,
    required TResult Function(CategoryResponse response) successGetCategories,
    required TResult Function(ProfessionResponse response)
        successGetProfessions,
    required TResult Function(VideoResponse response) successGetVideos,
  }) {
    return successGetProfessions(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiError<dynamic> error)? error,
    TResult? Function(CategoryResponse response)? successGetCategories,
    TResult? Function(ProfessionResponse response)? successGetProfessions,
    TResult? Function(VideoResponse response)? successGetVideos,
  }) {
    return successGetProfessions?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiError<dynamic> error)? error,
    TResult Function(CategoryResponse response)? successGetCategories,
    TResult Function(ProfessionResponse response)? successGetProfessions,
    TResult Function(VideoResponse response)? successGetVideos,
    required TResult orElse(),
  }) {
    if (successGetProfessions != null) {
      return successGetProfessions(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetCategories value) successGetCategories,
    required TResult Function(_SuccessGetProfessions value)
        successGetProfessions,
    required TResult Function(_SuccessGetVideos value) successGetVideos,
  }) {
    return successGetProfessions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetCategories value)? successGetCategories,
    TResult? Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult? Function(_SuccessGetVideos value)? successGetVideos,
  }) {
    return successGetProfessions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetCategories value)? successGetCategories,
    TResult Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult Function(_SuccessGetVideos value)? successGetVideos,
    required TResult orElse(),
  }) {
    if (successGetProfessions != null) {
      return successGetProfessions(this);
    }
    return orElse();
  }
}

abstract class _SuccessGetProfessions implements HomeState {
  factory _SuccessGetProfessions({required final ProfessionResponse response}) =
      _$SuccessGetProfessionsImpl;

  ProfessionResponse get response;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessGetProfessionsImplCopyWith<_$SuccessGetProfessionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessGetVideosImplCopyWith<$Res> {
  factory _$$SuccessGetVideosImplCopyWith(_$SuccessGetVideosImpl value,
          $Res Function(_$SuccessGetVideosImpl) then) =
      __$$SuccessGetVideosImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VideoResponse response});

  $VideoResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$SuccessGetVideosImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SuccessGetVideosImpl>
    implements _$$SuccessGetVideosImplCopyWith<$Res> {
  __$$SuccessGetVideosImplCopyWithImpl(_$SuccessGetVideosImpl _value,
      $Res Function(_$SuccessGetVideosImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessGetVideosImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as VideoResponse,
    ));
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoResponseCopyWith<$Res> get response {
    return $VideoResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$SuccessGetVideosImpl implements _SuccessGetVideos {
  _$SuccessGetVideosImpl({required this.response});

  @override
  final VideoResponse response;

  @override
  String toString() {
    return 'HomeState.successGetVideos(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetVideosImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetVideosImplCopyWith<_$SuccessGetVideosImpl> get copyWith =>
      __$$SuccessGetVideosImplCopyWithImpl<_$SuccessGetVideosImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiError<dynamic> error) error,
    required TResult Function(CategoryResponse response) successGetCategories,
    required TResult Function(ProfessionResponse response)
        successGetProfessions,
    required TResult Function(VideoResponse response) successGetVideos,
  }) {
    return successGetVideos(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiError<dynamic> error)? error,
    TResult? Function(CategoryResponse response)? successGetCategories,
    TResult? Function(ProfessionResponse response)? successGetProfessions,
    TResult? Function(VideoResponse response)? successGetVideos,
  }) {
    return successGetVideos?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiError<dynamic> error)? error,
    TResult Function(CategoryResponse response)? successGetCategories,
    TResult Function(ProfessionResponse response)? successGetProfessions,
    TResult Function(VideoResponse response)? successGetVideos,
    required TResult orElse(),
  }) {
    if (successGetVideos != null) {
      return successGetVideos(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessGetCategories value) successGetCategories,
    required TResult Function(_SuccessGetProfessions value)
        successGetProfessions,
    required TResult Function(_SuccessGetVideos value) successGetVideos,
  }) {
    return successGetVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessGetCategories value)? successGetCategories,
    TResult? Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult? Function(_SuccessGetVideos value)? successGetVideos,
  }) {
    return successGetVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessGetCategories value)? successGetCategories,
    TResult Function(_SuccessGetProfessions value)? successGetProfessions,
    TResult Function(_SuccessGetVideos value)? successGetVideos,
    required TResult orElse(),
  }) {
    if (successGetVideos != null) {
      return successGetVideos(this);
    }
    return orElse();
  }
}

abstract class _SuccessGetVideos implements HomeState {
  factory _SuccessGetVideos({required final VideoResponse response}) =
      _$SuccessGetVideosImpl;

  VideoResponse get response;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessGetVideosImplCopyWith<_$SuccessGetVideosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
