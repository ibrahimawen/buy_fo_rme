import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:buyforme/pages/h1.dart';
import 'package:buyforme/pages/home_page.dart';
import 'package:buyforme/pages/loginpage.dart';
import './core/shared_pref.dart';
import './pages/productpage.dart';
import 'pages/h2.dart';
import './pages/categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './data/model/cubit.dart';
import 'package:http/http.dart' as http;
import './pages/pageview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Pageview()
        // home: LoginPage(),
        // );
        //       home: ProductPage(
        //           productUrl:
        //               "https://www.amazon.com/Epson-EcoTank-Wireless-Cartridge-Free-Supertank/dp/B096N8DN2H/ref=sr_1_2?crid=5JQAB318HBKH&dib=eyJ2IjoiMSJ9.59GXeh3Rzvsz-uKhj3IP1RenK3b1LPMexPeckWGixj8TSUGhh5oI6X_Rn7yX-QytT96rNehgIoPMAuHEiBeGIvJxeFqfrUVOu2QoBIoA7WVhuDXv6UI_znZBya6yeZ9O4w6nvWazs0uhpD64r5KgqN20mqgBKSReQUS8BAD6D9v7gn8eD5AaCP5FHr1Jcxp418CX1xdYY7GwB0M9sJLV-kb-LQU7Ak9j-UEtSe50w6Q.qizJ07Xe9H0ieWJpPaQYpgSQWw9N5k0ehGneKNjA2cA&dib_tag=se&keywords=printer&qid=1729375383&sprefix=printer%2Caps%2C331&sr=8-2"));
        );
  }
}
