import 'package:dio/dio.dart';
import 'package:flutter_chatgpt/src/core/http_client.dart';

class ChatgptProvider {
  final String keyToken;
  final String url;
  final HttpClient client;
  ChatgptProvider(this.client, {required this.keyToken, required this.url}) {}

  request(String message) {
    client.post('',
        data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": message}
          ],
          "temperature": 0.7
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'authorization': 'Bearer $this.keyToken'
        }));
  }
}
