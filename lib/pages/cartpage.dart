import 'package:flutter/material.dart';
import '../data/repo/getcart.dart';
import '../data/model/productmodel.dart';

class CartPage extends StatefulWidget {
  final String email;

  CartPage({required this.email});

  @override
  _cartpage createState() => _cartpage();
}

class _cartpage extends State<CartPage> {
  static double total = 0;
  // void calculateTotal(List<Product> products) {
  //   double newTotal = 0;
  //   for (var product in products) {
  //     newTotal += double.parse(product.price.substring(1)) * 6.10;
  //   }
  //   setState(() {
  //     total = newTotal;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff87C5DE), Colors.white], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            Container(
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: const Color(0xff146C94),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          icon: const Center(
                            child: Icon(
                              Icons.navigate_before,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Cart",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: const Color(0xff146C94),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ))
                  ],
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: fetchUserCart(widget.email),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Your cart is empty'));
                  } else {
                    final products = snapshot.data!;
                    // calculateTotal(products);
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return SizedBox(
                          height: 120,
                          child: Card(
                            color: Colors.white,
                            child: Center(
                              child: ListTile(
                                leading: Image.network(product.imageUrl),
                                title: Text(
                                  product.title.substring(0, 10),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${(double.parse(product.price.substring(1)) * 6.10).toStringAsFixed(3)} LYD",
                                      style: const TextStyle(
                                          color: Color(0xff37b3f3),
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Image.asset("images/amazon.png"))
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Total:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("${total.toStringAsFixed(3)}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 400,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "check out",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xff0377AA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide.none),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
