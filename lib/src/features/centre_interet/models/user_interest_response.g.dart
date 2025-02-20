// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_interest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInterestResponseImpl _$$UserInterestResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInterestResponseImpl(
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UserInterestResponseImplToJson(
        _$UserInterestResponseImpl instance) =>
    <String, dynamic>{
      'interests': instance.interests,
    };
