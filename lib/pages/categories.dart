import 'package:flutter/material.dart';
import 'package:buyforme/pages/productpage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  _Categories createState() => _Categories();
}

class _Categories extends State<Categories> {
  Future<List<dynamic>>? _productList;

  @override
  void initState() {
    super.initState();
    _productList = fetchProducts();
  }

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(
        'http://192.168.1.178:3000/scrapes')); // Replace with your server IP

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  double price(String price) {
    double p = double.parse(price);

    return (p * 6.20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<dynamic>>(
      future: _productList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator()); // Show a loading indicator
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No products found'));
        } else {
          // double items = snapshot.data!.length;
          return ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> product = snapshot.data![index];

              return UnconstrainedBox(
                child: Container(
                  width: 300,
                  height: 180,
                  child: Card(
                    color: Color(0xff0377AA),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductPage(productUrl: product['productUrl']),
                          )),
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Image.network(product['imageUrl'],
                              width: 150, height: 100, fit: BoxFit.fill),
                        ),
                        Text(
                          product['title'].toString().substring(0, 30),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '${price(product['price'])} LYD',
                          style: TextStyle(color: Color(0xffF2DF3A)),
                        )
                      ]),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    ));
  }
}
