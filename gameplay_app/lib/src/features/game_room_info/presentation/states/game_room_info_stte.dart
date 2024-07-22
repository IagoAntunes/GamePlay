abstract class IGameRoomInfoState {}

abstract class IGameRoomInfoListener extends IGameRoomInfoState {}

class SuccessGameRoomInfoListener extends IGameRoomInfoListener {}

class FailureGameRoomInfoListener extends IGameRoomInfoListener {}

class IdleGameRoomInfoState extends IGameRoomInfoState {}

class LoadingGameRoomInfoState extends IGameRoomInfoState {}

class SuccessGameRoomInfoState extends IGameRoomInfoState {}

class FailureGameRoomInfoState extends IGameRoomInfoState {}
