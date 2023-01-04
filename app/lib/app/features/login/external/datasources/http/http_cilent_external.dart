import 'package:http/http.dart';

import '../../../infra/datasources/http/http.dart';

class HttpClientExternal implements HttpClient {
  final Client client;

  HttpClientExternal(this.client);

  @override
  Future<void> request({String? url, String? method, Map? headers, Map? body}) {
    throw UnimplementedError();
  }

}