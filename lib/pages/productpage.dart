import 'package:flutter/material.dart';
import '../data/repo/productrepo.dart'; // Import the service that fetches data

class ProductPage extends StatefulWidget {
  final String productUrl; // URL of the Amazon product

  ProductPage({required this.productUrl});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<Map<String, dynamic>>? _productData;

  @override
  void initState() {
    super.initState();
    _productData = fetchAmazonProductData(widget.productUrl);
  }

  double price(String pri) {
    double p = double.parse(pri.substring(1).replaceAll(',', ''));
    return (p * 6.20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Amazon Product Info'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _productData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Show loading spinner
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error} ,${snapshot.connectionState.toString()}'));
          } else if (snapshot.hasData) {
            final product = snapshot.data!;
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      product['imageUrl'] != null
                          ? Image.network(
                              product['imageUrl'],
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                      SizedBox(height: 16),

                      // Display product title
                      Text(
                        product['title'].toString().substring(0, 30) ??
                            'No title available',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),

                      // Display product price
                      Text(
                        '${price(product['price'])} LYD' ??
                            'No price available',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff0377AA),
                        ),
                      ),
                      SizedBox(height: 8),

                      // Display product description
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Description:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        // product['description']
                        product['title'] ?? 'No description available',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                // Display product image
                SizedBox(
                  height: 90,
                ),
                Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff0377AA)),
                  padding: EdgeInsets.only(right: 10, left: 10),
                  // color: Color(0xff0377AA),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    minimumSize: Size(50, 2),
                                    padding: EdgeInsets.only(bottom: 15)),
                                onPressed: () {},
                                icon: Icon(Icons.minimize)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    minimumSize: Size(50, 2)),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_bag,
                                color: Colors.black,
                              ),
                              Text(
                                "Add to cart",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide.none))
                    ],
                  ),
                )
              ],
            ));
          } else {
            return Center(child: Text('No product data available'));
          }
        },
      ),
    );
  }
}
