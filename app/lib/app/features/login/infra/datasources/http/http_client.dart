abstract class HttpClient {
  Future<void> request({required String url, String method, Map? headers, Map? body});
}