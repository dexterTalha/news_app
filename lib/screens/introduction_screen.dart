import 'package:flutter/material.dart';
import 'package:news_app/components/walkthrough_component.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final list = [
    WalkThroughComponent(text: "Test", asset: "assets/logo.png", secondaryText: "secondaryText"), //0
    WalkThroughComponent(text: "Test2", asset: "assets/logo.png", secondaryText: "secondaryText2"), //1
    WalkThroughComponent(text: "Test3", asset: "assets/logo.png", secondaryText: "secondaryText3"), //2
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: indicator(),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: PageView(
          children: list,
          // scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            print(index);
            selectedIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(list.length, (index) {
        return Container(
          height: 20,
          width: 20,
          color: selectedIndex == index ? Colors.red : Colors.green,
        );
      }),
    );
  }
}
