import 'dart:convert';

import 'package:http/http.dart';

import 'http_client.dart';
import 'utils/http_error.dart';
import 'utils/respostasServidor.dart';

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
    return respostasServidor(response);
  }

}
