import 'dart:convert';
import 'dart:math';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatgptMapping {
  final user = const types.User(
      id: '82091008-a484-4a89-ae75-a22bf8d6fgpt',
      firstName: "ChatGpt",
      lastName: "OpenIA");

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  types.TextMessage createSystemMessage(String message) {
    return createMessage(user, message);
  }

   types.TextMessage createMessage(types.User user,String message) {
    final textMessage = types.TextMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: message);
    return textMessage;
  }

  String getContentFromResponse(dynamic response){
    return (response.data['choices'] as List)[0]['message']['content'];
  }
}
