import 'package:flutter_chatgpt/src/domain/mappings/chatgpt_mappping.dart';
import 'package:flutter_chatgpt/src/domain/repositories/chatgpt_repository.dart';
import 'package:flutter_chatgpt/src/main/factory/chatgpt_provider.dart';

var chatgptRepository=ChatgptRepository(chatgptProvider, ChatgptMapping());