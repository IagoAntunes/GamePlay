class EnterGameRoomRequest {
  EnterGameRoomRequest({
    required this.idGameRoom,
    required this.idUser,
  });
  final int idGameRoom;
  final int idUser;

  Map<String, dynamic> toMap() {
    return {
      'idGameRoom': idGameRoom,
      'idUser': idUser,
    };
  }
}
