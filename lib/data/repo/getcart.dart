import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/productmodel.dart';

Future<List<Product>> fetchUserCart(String email) async {
  final url = Uri.parse('http://192.168.1.104:3000/api/getUserCart/$email');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Parse the response body as JSON
    final data = json.decode(response.body);
    // Convert the "product" list in JSON to a list of Product objects
    return (data['product'] as List)
        .map((item) => Product.fromJson(item))
        .toList();
  } else {
    throw Exception('Failed to load cart data');
  }
}
