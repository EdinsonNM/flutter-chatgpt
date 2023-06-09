import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_chatgpt/src/core/http_client.dart';
import 'package:flutter_chatgpt/src/main/factory/httpclient_factory.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpDioClient implements HttpClient<dynamic, Response, Options> {
  late Dio api = Dio();
  String urlServer;
  HttpDioClient({this.urlServer = ''}) {
    instanceDio(urlServer);
    addInterceptors();
  }
  instanceDio(String urlServer) {
    var options = BaseOptions(
        baseUrl: urlServer,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    api = Dio(options);
  }

  addInterceptors() {
    api.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }
  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      bool useCache = false}) {
    return api.get(url, queryParameters: queryParameters, options: options);
  }

  @override
  Future<Response> post(String url,
      {Map<String, dynamic>? data,
      List<Map<String, dynamic>>? arrayData,
      FormData? multiPartData,
      Options? options,
      bool useCache = false}) {
    return api.post(urlServer,
        data: data ?? multiPartData ?? arrayData, options: options);
  }

  Future<Response> put(String url,
      {Map<String, dynamic>? data, Options? options, bool useCache = false}) {
    return api.put(url, data: data, options: options);
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? data, Options? options}) {
    return api.delete(url, data: data, options: options);
  }

  Future<Response> patch(String url,
      {Map<String, dynamic>? data, Options? options}) {
    return api.patch(url, data: data, options: options);
  }
}
