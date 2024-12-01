// ignore_for_file: file_names
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  final String baseUrl = dotenv.env['baseUrl'] as String;
}
