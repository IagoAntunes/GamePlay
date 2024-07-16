abstract class IControlAuthState {
  bool isAuthenticated;
  final String? user;
  IControlAuthState({
    required this.isAuthenticated,
    this.user,
  });
}

class ControlAuthState extends IControlAuthState {
  ControlAuthState({required super.isAuthenticated});
}

abstract class IControlAuthListener extends IControlAuthState {
  IControlAuthListener({required super.isAuthenticated});
}

class LogoutControlAuthListener extends IControlAuthListener {
  LogoutControlAuthListener() : super(isAuthenticated: false);
}

class LoggedControlAuthListener extends IControlAuthListener {
  LoggedControlAuthListener() : super(isAuthenticated: true);
}
