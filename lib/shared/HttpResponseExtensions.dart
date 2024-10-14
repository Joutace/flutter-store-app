// ignore_for_file: file_names

import 'package:http/http.dart' as http;

extension HttpResponseExtensions on http.Response {
  bool isSuccess() {
    return statusCode == 200;
  }
}
