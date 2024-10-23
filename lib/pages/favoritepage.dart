import 'package:flutter/material.dart';

class Favoritepage extends StatefulWidget {
  _Favoritepage createState() => _Favoritepage();
}

class _Favoritepage extends State<Favoritepage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Text("no favrite products"),
      )),
    );
  }
}
