import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_colors.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigatettohomepage() {
    Timer(const Duration(seconds: 2), () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigatettohomepage();

    return Scaffold(
        backgroundColor: MyColors.myYellow,
        body: SafeArea(
          child: Center(
            child: Image.asset(
              "assets/icons/logo.png",
              height: 150,
            ),
          ),
        ));
  }
}
