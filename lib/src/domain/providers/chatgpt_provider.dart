abstract class ChatgptProvider<Response>{
  Future<dynamic> request(String message);
}