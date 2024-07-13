import 'dart:convert';

class RegisterUserRequest {
  RegisterUserRequest({
    required this.username,
    required this.password,
    this.role = 1,
  });
  final String username;
  final String password;
  final int role;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'role': role,
    };
  }

  factory RegisterUserRequest.fromMap(Map<String, dynamic> map) {
    return RegisterUserRequest(
      username: map['username'] as String,
      password: map['password'] as String,
      role: map['role'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserRequest.fromJson(String source) =>
      RegisterUserRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
