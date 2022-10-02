import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DashBoardScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.amber.shade600,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img.png",
                width: mWidth / 4,
                height: mHeight / 6,
              ),
              Image.asset(
                "assets/img_1.png",
                width: mWidth / 4,
                height: mHeight / 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
