import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment{
  static final chatgptKey=dotenv.get('CHATGPT_API_TOKEN',fallback: '');
  static final chatgptUrlServer=dotenv.get('CHATGPT_URL_SERVER',fallback: '');
}