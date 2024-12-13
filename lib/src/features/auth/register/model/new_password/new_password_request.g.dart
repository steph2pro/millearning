// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewPasswordRequestImpl _$$NewPasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$NewPasswordRequestImpl(
      phone: json['phone'] as String,
      newPassword: json['newPassword'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$NewPasswordRequestImplToJson(
        _$NewPasswordRequestImpl instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'newPassword': instance.newPassword,
      'accessToken': instance.accessToken,
    };
