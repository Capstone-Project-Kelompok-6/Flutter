class UserToken {
  String user_id;
  String full_name;
  String email;
  String phone_number;
  String access_token;
  String refresh_token;

  UserToken(
      {this.phone_number = '',
      this.email = '',
      this.full_name = '',
      this.user_id = '',
      this.access_token = '',
      this.refresh_token = ''});

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      user_id: json['user_id'],
      full_name: json['full_name'],
      email: json['email'],
      phone_number: json['phone_number'],
      access_token: json['access_token'],
      refresh_token: json['refresh_token'],
    );
  }
}
