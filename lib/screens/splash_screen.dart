import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controller/common_controller.dart';
import 'package:news_app/screens/introduction_screen.dart';
import 'package:news_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void moveToNextPage() async {
    bool isOld = await CommonController().getIntroductionPref();

    if (mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (c) => isOld ? const LoginScreen() : const IntroductionScreen(),
          ));
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 2), moveToNextPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: const Center(
          child: Text("My News App"),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadedSlideAnimation(
              beginOffset: Offset(0, -10),
              endOffset: Offset(0, 0),
              // fadeDuration: Duration.zero,
              // scaleDuration: Duration.zero,
              child: Image.asset(
                "assets/logo.png",
                height: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
