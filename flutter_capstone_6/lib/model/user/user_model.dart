class UserModel<T> {
  String message;
  T? data;

  UserModel({this.message = '', this.data});

  factory UserModel.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    return UserModel(
        message: json['message'],
        data: (json['data'] != null) ? fromJsonModel(json['data']) : null);
  }
}
