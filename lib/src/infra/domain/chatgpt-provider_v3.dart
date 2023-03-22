
import 'package:dio/dio.dart';
import 'package:flutter_chatgpt/src/core/http_client.dart';
import 'package:flutter_chatgpt/src/domain/providers/chatgpt_provider.dart';

class ChatgptProviderV3 implements ChatgptProvider {
  final String keyToken;
  final HttpClient client;
  ChatgptProviderV3(this.client, {required this.keyToken});
  
  @override
  Future<dynamic> request(String message) {
    return client.post('',
        data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": message}
          ],
          "temperature": 0.7
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $keyToken'
        }));
  }
}
