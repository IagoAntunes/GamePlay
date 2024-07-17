class AppApiUrls {
  static const String _baseUrl = "http://192.168.5.178:8080";

  //Auth
  static const String registerUser = "$_baseUrl/auth/register";
  static const String login = "$_baseUrl/auth/login";

  //Categories
  static const String categories = "$_baseUrl/categories";

  //GameRoom
  static const String _baseGameRoom = "$_baseUrl/gameRoom";
  static const String getAllGameRoom = "$_baseGameRoom/getAll";
  static const String createGameRoom = "$_baseGameRoom/create";

  //Games
  static const String _baseGames = "$_baseUrl/games";
  static const String getGames = _baseGames;
}
