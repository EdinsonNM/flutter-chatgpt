import 'package:flutter_chatgpt/src/domain/mappings/chatgpt_mappping.dart';
import 'package:flutter_chatgpt/src/domain/providers/chatgpt_provider.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatgptRepository {
  ChatgptProvider chatProvider;
  ChatgptMapping chatgptMapping;
  ChatgptRepository(this.chatProvider, this.chatgptMapping);

  Stream<types.TextMessage> request(String message) {
    return Stream<String>.value(message)
        .asyncMap((event) => chatProvider.request(message))
        .map((response) => response.data as String)
        .map(chatgptMapping.createSystemMessage)
        .handleError((e) => chatgptMapping.createSystemMessage("Ocurrio un error"))
        ;
  }
}
