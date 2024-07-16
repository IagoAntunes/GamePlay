class GameModel {
  String id;
  String name;
  String imageUrl;

  GameModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      id: map['id'].toString(),
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
