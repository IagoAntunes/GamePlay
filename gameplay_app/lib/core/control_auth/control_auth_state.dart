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
