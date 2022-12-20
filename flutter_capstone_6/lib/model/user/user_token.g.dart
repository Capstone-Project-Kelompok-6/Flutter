// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserToken _$UserTokenFromJson(Map<String, dynamic> json) {
  return UserToken(
    userId: json['user_id'] as String,
    fullName: json['full_name'] as String,
    email: json['email'] as String,
    phoneNumber: json['phone_number'] as String,
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
    image: json['image'] as String,
    imageName: json['image_name'] as String,
  );
}

Map<String, dynamic> _$UserTokenToJson(UserToken instance) => <String, dynamic>{
      'user_id': instance.userId,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'image': instance.image,
      'image_name': instance.imageName,
    };
