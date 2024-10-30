import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> addToCart(String username, String producturl) async {
  final url = Uri.parse('http://192.168.1.104:3000/api/cart');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'email': username,
      'producturl': producturl,
    }),
  );

  if (response.statusCode == 201) {
    // Show success message
    print('Product added to cart successfully!');
  } else {
    // Handle error
    print('Failed to add to cart');
  }
}
