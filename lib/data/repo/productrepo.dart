import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchAmazonProductData(String producturl) async {
  final apiurl = "http://192.168.1.104:3000/api/getproductinfo?url=$producturl";
  final response = await http.get(Uri.parse(apiurl));
  try {
    if (response.statusCode == 200)
      return jsonDecode(response.body);
    else {
      throw Exception('faild to fetch product data');
    }
  } catch (e) {
    throw Exception('error fetching data $e ${response.statusCode}');
  }
}
