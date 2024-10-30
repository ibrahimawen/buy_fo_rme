import 'package:buyforme/pages/cartpage.dart';
import 'package:buyforme/pages/favoritepage.dart';
import 'package:buyforme/pages/home_page.dart';
import 'package:flutter/material.dart';

class Pageview extends StatefulWidget {
  @override
  _Pageview createState() => _Pageview();
}

class _Pageview extends State<Pageview> {
  int indexs = 0;
  List<Widget> widgetlist = [
    HomePage(),
    Favoritepage(),
    CartPage(email: "saoud")
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff0377AA),
        // unselectedItemColor: col,
        onTap: (index) {
          setState(() {
            indexs = index;
          });
        },
        currentIndex: indexs,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken_sharp), label: "favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
        ],
      ),
      body: Center(
        child: widgetlist[indexs],
      ),
    );
  }
}
