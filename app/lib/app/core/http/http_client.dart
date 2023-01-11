abstract class HttpClient {
  Future<void> request({required String url, required String method, required Map<String, String> headers, Map? body});
}