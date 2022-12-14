import 'package:flutter/material.dart';
import 'package:news_app/components/walkthrough_component.dart';
import 'package:news_app/controller/common_controller.dart';

import 'login_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final list = const [
    WalkThroughComponent(text: "Test", asset: "assets/logo.png", secondaryText: "secondaryText"), //0
    WalkThroughComponent(text: "Test2", asset: "assets/logo.png", secondaryText: "secondaryText2"), //1
    WalkThroughComponent(text: "Test3", asset: "assets/logo.png", secondaryText: "secondaryText3"), //2
  ];

  int selectedIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  void getToLogin() async {
    await CommonController().setIntroductionPref();
    if (mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (c) => const LoginScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  getToLogin();
                },
                child: const Text("SKIP"),
              ),
            ),
            indicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (selectedIndex == list.length - 1) {
                      getToLogin();
                    } else {
                      selectedIndex++;
                      _pageController.animateToPage(
                        selectedIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      setState(() {});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      selectedIndex == list.length - 1 ? Icons.check : Icons.arrow_forward,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 3,
            center: Alignment.bottomRight,
            colors: [Colors.purple, Colors.greenAccent, Colors.blue],
          ),
        ),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            print(index);
            selectedIndex = index;
            setState(() {});
          },
          children: list,
        ),
      ),
    );
  }

  Widget indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        list.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: selectedIndex == index ? 20 : 10,
              width: selectedIndex == index ? 20 : 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }
}
