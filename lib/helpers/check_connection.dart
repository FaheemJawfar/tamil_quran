import 'package:http/http.dart' as http;

class CheckConnection {


  static Future<bool> checkInternetConnection() async {
    try {
      final response = await http.head(Uri.parse('http://www.google.com'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}