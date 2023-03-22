import 'package:flutter_chatgpt/src/infra/domain/chatgpt-provider_v3.dart';
import 'package:flutter_chatgpt/src/main/config/environment.dart';
import 'package:flutter_chatgpt/src/main/factory/httpclient_factory.dart';

var chatgptProvider=ChatgptProviderV3(httpClientFactory, keyToken:Environment.chatgptKey);