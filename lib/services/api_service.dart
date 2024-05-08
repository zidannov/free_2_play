import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final String baseUrl = dotenv.env['BASE_URL']!;
  final String apiKey = dotenv.env['RAPIDAPI_KEY']!;
  final String apiHost = dotenv.env['RAPIDAPI_HOST']!;
}
