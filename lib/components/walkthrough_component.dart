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
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(asset),
        ),
        const SizedBox(height: 30),
        TextComp(text: secondaryText)
      ],
    );
  }
}
