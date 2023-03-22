import 'package:flutter_chatgpt/src/infra/core/http_dio_client.dart';
import 'package:flutter_chatgpt/src/main/config/environment.dart';

var httpClientFactory= HttpDioClient(urlServer: Environment.chatgptUrlServer);