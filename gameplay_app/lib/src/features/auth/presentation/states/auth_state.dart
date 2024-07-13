// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class IAuthState {}

class IdleAuthState extends IAuthState {}

class LoadingAuthState extends IAuthState {}

class SuccessAuthState extends IAuthState {}

class FailureAuthState extends IAuthState {}

abstract class IAuthListener extends IAuthState {
  String message;
  IAuthListener({
    required this.message,
  });
}

class SuccessAuthListener extends IAuthListener {
  SuccessAuthListener({required super.message});
}

class FailureAuthListener extends IAuthListener {
  FailureAuthListener({required super.message});
}
