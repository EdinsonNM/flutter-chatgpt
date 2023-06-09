import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chatgpt/src/domain/mappings/chatgpt_mappping.dart';
import 'package:flutter_chatgpt/src/main/factory/chatgpt_repository.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _user = const types.User(
      id: '82091008-a484-4a89-ae75-a22bf8d6f3ac', firstName: "Edinson");
  final List<types.Message> messages = [];

  addmessage(types.Message message) {
    setState(() {
      messages.insert(0, message);
    });
  }

  handleSendPress(types.PartialText message) {
    final textMessage = ChatgptMapping().createMessage(_user, message.text);
    addmessage(textMessage);
    chatgptRepository.request(message.text).listen((event) { 
      addmessage(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat GPT",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.grey.shade800,
      ),
      body: Container(
          padding: const EdgeInsets.all(0),
          child: Chat(
              theme: DefaultChatTheme(
                  sentEmojiMessageTextStyle: const TextStyle(fontSize: 90),
                  backgroundColor: Colors.grey.shade800,
                  inputBackgroundColor: Colors.deepPurple,
                  inputBorderRadius:
                      const BorderRadius.all(Radius.circular(40)),
                  inputMargin: const EdgeInsets.all(10)),
              messages: messages,
              onSendPressed: handleSendPress,
              user: _user)),
    );
  }
}
