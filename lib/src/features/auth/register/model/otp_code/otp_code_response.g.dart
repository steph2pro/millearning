// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpCodeResponseImpl _$$OtpCodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpCodeResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$OtpCodeResponseImplToJson(
        _$OtpCodeResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'email': instance.email,
      'phone': instance.phone,
      'accessToken': instance.accessToken,
    };
