import 'package:json_annotation/json_annotation.dart';

part 'user_token.g.dart';

@JsonSerializable()
class UserToken {
  UserToken({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.accessToken,
    required this.refreshToken,
  });

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  factory UserToken.fromJson(Map<String, dynamic> json) =>
      _$UserTokenFromJson(json);
  Map<String, dynamic> toJson() => _$UserTokenToJson(this);
}
