class CreateGameRoomRequest {
  CreateGameRoomRequest({
    required this.date,
    required this.description,
    required this.idCategory,
    required this.idGame,
    required this.idUserOwner,
  });
  String date;
  String description;
  int idGame;
  int idCategory;
  int idUserOwner;

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'description': description,
      'idGame': idGame,
      'idCategory': idCategory,
      'idUserOwner': idUserOwner,
    };
  }
}
