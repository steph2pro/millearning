// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cv_preview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CvPreviewModel _$CvPreviewModelFromJson(Map<String, dynamic> json) {
  return _CvPreviewModel.fromJson(json);
}

/// @nodoc
mixin _$CvPreviewModel {
  int get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;

  /// Serializes this CvPreviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CvPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CvPreviewModelCopyWith<CvPreviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CvPreviewModelCopyWith<$Res> {
  factory $CvPreviewModelCopyWith(
          CvPreviewModel value, $Res Function(CvPreviewModel) then) =
      _$CvPreviewModelCopyWithImpl<$Res, CvPreviewModel>;
  @useResult
  $Res call({int id, String imageUrl, List<String> options});
}

/// @nodoc
class _$CvPreviewModelCopyWithImpl<$Res, $Val extends CvPreviewModel>
    implements $CvPreviewModelCopyWith<$Res> {
  _$CvPreviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CvPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CvPreviewModelImplCopyWith<$Res>
    implements $CvPreviewModelCopyWith<$Res> {
  factory _$$CvPreviewModelImplCopyWith(_$CvPreviewModelImpl value,
          $Res Function(_$CvPreviewModelImpl) then) =
      __$$CvPreviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String imageUrl, List<String> options});
}

/// @nodoc
class __$$CvPreviewModelImplCopyWithImpl<$Res>
    extends _$CvPreviewModelCopyWithImpl<$Res, _$CvPreviewModelImpl>
    implements _$$CvPreviewModelImplCopyWith<$Res> {
  __$$CvPreviewModelImplCopyWithImpl(
      _$CvPreviewModelImpl _value, $Res Function(_$CvPreviewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CvPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? options = null,
  }) {
    return _then(_$CvPreviewModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CvPreviewModelImpl implements _CvPreviewModel {
  const _$CvPreviewModelImpl(
      {required this.id,
      required this.imageUrl,
      required final List<String> options})
      : _options = options;

  factory _$CvPreviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CvPreviewModelImplFromJson(json);

  @override
  final int id;
  @override
  final String imageUrl;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'CvPreviewModel(id: $id, imageUrl: $imageUrl, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CvPreviewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, imageUrl, const DeepCollectionEquality().hash(_options));

  /// Create a copy of CvPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CvPreviewModelImplCopyWith<_$CvPreviewModelImpl> get copyWith =>
      __$$CvPreviewModelImplCopyWithImpl<_$CvPreviewModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CvPreviewModelImplToJson(
      this,
    );
  }
}

abstract class _CvPreviewModel implements CvPreviewModel {
  const factory _CvPreviewModel(
      {required final int id,
      required final String imageUrl,
      required final List<String> options}) = _$CvPreviewModelImpl;

  factory _CvPreviewModel.fromJson(Map<String, dynamic> json) =
      _$CvPreviewModelImpl.fromJson;

  @override
  int get id;
  @override
  String get imageUrl;
  @override
  List<String> get options;

  /// Create a copy of CvPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CvPreviewModelImplCopyWith<_$CvPreviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
