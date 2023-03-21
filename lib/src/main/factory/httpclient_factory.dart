import 'package:flutter_chatgpt/src/core/http_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
String urlServer=dotenv.env['CHATGPT_API_KEY'] as String;
const httpClientFactory= HttpClient(urlServer: urlServer)