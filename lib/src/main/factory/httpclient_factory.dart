import 'package:flutter_chatgpt/src/infra/core/http_dio_client.dart';
import 'package:flutter_chatgpt/src/main/config/environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String urlServer=dotenv.env['CHATGPT_API_KEY'] as String;

var httpClientFactory= HttpDioClient(urlServer: Environment.chatgptUrlServer);