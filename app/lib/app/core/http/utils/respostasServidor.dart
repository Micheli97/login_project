import 'dart:convert';
import 'package:http/http.dart';

import 'http_error.dart';

dynamic respostasServidor(Response response) {
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