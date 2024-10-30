import 'dart:convert';
import 'package:http/http.dart' as http;

class Userapirepo {
  static const String _baseurl = "http://192.168.1.104:3000/api";

  static Future<http.Response> login(String email, String password) async {
    final url = Uri.parse('$_baseurl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': password}),
    );
    return response;
  }
}
