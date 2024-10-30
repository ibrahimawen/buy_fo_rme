import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../data/repo/userapirepo.dart';
import '../core/shared_pref.dart';
import './pageview.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('error'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text('okay'))
              ],
            ));
  }

  Future<void> _login() async {
    String email = _email.text;
    String password = _password.text;

    try {
      final response = await Userapirepo.login(email, password);
      if (response.statusCode == 200) {
        final responsedata = jsonDecode(response.body);
        String token = responsedata['token'];
        await SharedPrefHelper.saveToken(token);
        _showErrorDialog('true');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Pageview()),
        );
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('Login successful!'),
        //     backgroundColor: Colors.green,
        //     duration: Duration(seconds: 2), // Set the duration of the SnackBar
        //   ),
        // );
      } else {
        _showErrorDialog(response.statusCode.toString());
      }
    } catch (e) {
      _showErrorDialog(e.toString());
    }
    setState(() {
      isLoading = false; // Hide progress indicator
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF5db0d1),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        // color: Colors.white,
        width: 400,
        child: Column(
          children: [
            Container(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_left,
                      color: Color(0xff363636),
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("images/loginpage.png"),
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter your login details and password",
              style: TextStyle(color: Color(0xff7c7c7c)),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 331,
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    hintText: "Enter your Email",
                    hintStyle: TextStyle(color: Color(0xff8391A1)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2))
                    // fillColor: Color(0xffF7F8F9),
                    // filled: true,

                    // OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     borderSide: BorderSide.none)

                    ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 331,
              child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(0xff8391A1),
                      ),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(color: Color(0xff8391A1)),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)))),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                width: 320,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forget password?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFF746B)),
                    )
                  ],
                )),
            const SizedBox(
              height: 25,
            ),
            OutlinedButton(
              onPressed: isLoading ? null : _login,
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                  minimumSize: Size(331, 56),
                  backgroundColor: Color(0xff1E3E62),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  side: BorderSide.none),
            ),
            SizedBox(
              height: 25,
            ),
            Text("or"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?"),
                  Text(
                    " Create a new account",
                    style: TextStyle(
                        color: Color(0xffFF746B), fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
