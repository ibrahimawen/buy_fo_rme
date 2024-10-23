import 'dart:convert';
import 'package:http/http.dart' as http;

class Userapirepo {
  static const String _baseurl = "http://10.0.2.2:3000/api/auth";

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
