import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:buyforme/pages/productpage.dart';

class HomePageTwo extends StatefulWidget {
  @override
  _HomePageTwoState createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  Future<List<dynamic>>? _productList;

  @override
  void initState() {
    super.initState();
    _productList = fetchProducts();
  }

  Future<List<dynamic>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://192.168.3.104:3000/scrapes'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon Products'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _productList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Show a loading indicator
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> product = snapshot.data![index];

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(product['imageUrl'],
                        width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(product['title']),
                    subtitle: Text('Price: ${product['price']}'),
                    // onTap: () {
                    //   // Open product in web browser
                    //   // You can also navigate to a detailed product page within your app
                    //   launch(product['productUrl']);
                    // },
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductPage(productUrl: product['productUrl']),
                        )),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
