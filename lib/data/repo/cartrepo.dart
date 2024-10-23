import 'dart:convert';

import 'package:http/http.dart' as http;

class Cartrepo {
  static const String _baseurl = 'http://192.168.0.7:3000/cart';

  static Future<http.Response> addtocart(String producturl) async {
    final url = Uri.parse('$_baseurl');
    final response =
        await http.post(url, body: jsonEncode({'url': producturl}));
    return response;
  }
}
