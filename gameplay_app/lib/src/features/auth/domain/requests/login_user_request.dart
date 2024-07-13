import 'dart:convert';

class LoginUserRequest {
  String username;
  String password;
  LoginUserRequest({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory LoginUserRequest.fromMap(Map<String, dynamic> map) {
    return LoginUserRequest(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserRequest.fromJson(String source) =>
      LoginUserRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
