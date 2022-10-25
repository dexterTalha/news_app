import 'package:flutter/material.dart';

import 'text_component.dart';

class WalkThroughComponent extends StatelessWidget {
  final String text;
  final String asset;
  final String secondaryText;
  const WalkThroughComponent({Key? key, required this.text, required this.asset, required this.secondaryText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 50, left: 50),
          child: Image.asset(
            asset,
          ),
        ),
        const SizedBox(height: 30),
        const Spacer(),
        TextComp(text: secondaryText)
      ],
    );
  }
}
