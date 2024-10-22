abstract class NetworkingEngine {
  Future<Map<String, dynamic>> post(
      {required String url,
      required dynamic body,
      Map<String, String> headers = const {}});

  Future<Map<String, dynamic>> get(
      {required String url, Map<String, String> headers = const {}});
}
