abstract class HttpClient<Request,Response, Options>{
  
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      bool useCache = false});

  Future<Response> post(String url,
      {Map<String, dynamic>? data,
      List<Map<String, dynamic>>? arrayData,
      Options? options,
      bool useCache = false});

  Future<Response> put(String url,
      {Map<String, dynamic>? data, Options? options, bool useCache = false});

  Future<Response> delete(String url,
      {Map<String, dynamic>? data, Options? options}) ;

  Future<Response> patch(String url,
      {Map<String, dynamic>? data, Options? options});

}