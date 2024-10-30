import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:buyforme/pages/loginpage.dart';
import 'package:buyforme/pages/pageview.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff87C5DE), Colors.white], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: AnimatedSplashScreen(
          // backgroundColor: Color(0xff0377AA),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.transparent,
          splash: Column(
            children: [
              Center(
                child: LottieBuilder.asset('assets/lottie/splash.json'),
              ),
              // AnimatedDefaultTextStyle(child: child, style: style, duration: duration)
            ],
          ),
          duration: 2000,
          splashIconSize: 450,
          nextScreen: LoginPage()),
    );
  }
}
