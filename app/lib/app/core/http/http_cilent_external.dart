import 'dart:convert';

import 'package:http/http.dart';

import 'http_client.dart';
import '../../features/login/external/datasources/http/http_error.dart';

class HttpClientExternal implements HttpClient {
  final Client client;

  HttpClientExternal(this.client);

  @override
  Future<Map<dynamic, dynamic>> request({
    required String url,
    String? method,
    Map? headers,
    Map? body,
  }) async {
    final cabecalho = headers?.cast<String, String>() ?? {}
      ..addAll(
        {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      );

    final jsonBody = jsonEncode(body);

    var response =  Response('', 500);

    Future<Response> futureResponse;

    try {
        futureResponse = client.post(Uri.parse(url), headers: cabecalho, body: jsonBody);
      
        response = await futureResponse.timeout(const Duration(seconds: 10));
      
    } catch (e) {
      throw HttpError.serverError;
    }
    return serverResponses(response);
  }

  dynamic serverResponses(Response response) {
    switch (response.statusCode) {
      case 200: return jsonDecode(response.body);
      case 204: return 'Erro Inesperado!';
      case 400: throw HttpError.badRequest;
      case 401: throw HttpError.unauthorized;
      case 403: throw HttpError.forbiden;
      case 404: throw HttpError.notFound;
      default: throw HttpError.serverError;
    }
  }
  
}
