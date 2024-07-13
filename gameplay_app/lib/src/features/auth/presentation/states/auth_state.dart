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

class SuccessRegisterListener extends IAuthListener {
  SuccessRegisterListener({required super.message});
}

class FailureRegisterListener extends IAuthListener {
  FailureRegisterListener({required super.message});
}

class SuccessLoginListener extends IAuthListener {
  SuccessLoginListener({required super.message});
}

class FailureLoginListener extends IAuthListener {
  FailureLoginListener({required super.message});
}
