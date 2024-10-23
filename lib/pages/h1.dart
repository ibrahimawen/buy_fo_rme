import 'package:flutter/material.dart';
import '../data/repo/productrepo.dart';

class Homepage extends StatefulWidget {
  final String producturl;
  Homepage({required this.producturl});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Homepage> {
  Future<Map<String, dynamic>>? _productData;

  @override
  void initState() {
    super.initState();
    // Fetch product data when the page initializes
    _productData = fetchAmazonProductData(widget.producturl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                    style: IconButton.styleFrom(
                        backgroundColor: Color(0xff0377AA)),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Deliver to",
                            style: TextStyle(color: Color(0xffDADADA))),
                        Text("Tripoli, alzahra")
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 165,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: Color(0xff146C94),
                    ),
                    style: IconButton.styleFrom(
                        backgroundColor: Color(0xffCFE6F1)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 330,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xffC5C5C5),
                  ),
                  fillColor: Color(0xffF7F8F9),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Container(
              width: 320,
              alignment: Alignment.centerLeft,
              child: Text(
                "Stores",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                width: 320,
                height: 170,
                child: FutureBuilder(
                  future: _productData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error"),
                      );
                    } else if (snapshot.hasData) {
                      final product = snapshot.data!;
                      return Card(
                        child: Image.network(
                          product['imageUrl'],
                          fit: BoxFit.cover,
                        ),
                      );
                    } else
                      return Center(
                        child: Text("no product"),
                      );
                  },
                ))
          ],
        ),
      )),
    );
  }
}
