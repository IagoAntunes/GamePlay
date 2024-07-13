class LoginUserResult {
  String message;
  bool isSuccess;
  String token;
  String username;
  LoginUserResult({
    required this.message,
    required this.isSuccess,
    required this.token,
    required this.username,
  });
}
