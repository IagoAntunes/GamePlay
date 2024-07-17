abstract class ICreateGameRoomState {}

class IdleCreateGameRoomState extends ICreateGameRoomState {}

class LoadingCreateGameRoomState extends ICreateGameRoomState {}

class SuccessCreateGameRoomState extends ICreateGameRoomState {
  SuccessCreateGameRoomState();
}

class FailureCreateGameRoomState extends ICreateGameRoomState {}

abstract class ICreateGameRoomListener extends ICreateGameRoomState {}

class SuccessCreateGameRoomListener extends ICreateGameRoomListener {
  SuccessCreateGameRoomListener();
}

class FailureCreateGameRoomListener extends ICreateGameRoomListener {}
