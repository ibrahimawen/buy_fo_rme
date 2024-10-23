import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  _Cartpage createState() => _Cartpage();
}

class _Cartpage extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Text("no  products yet"),
      )),
    );
  }
}
