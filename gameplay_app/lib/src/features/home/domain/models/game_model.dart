class GameModel {
  int id;
  String name;
  String imageUrl;
  String bannerUrl;

  GameModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.bannerUrl,
  });

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      bannerUrl: map['bannerUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'bannerUrl': bannerUrl,
    };
  }
}
