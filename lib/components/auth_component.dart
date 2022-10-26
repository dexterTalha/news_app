import 'package:flutter/material.dart';
import 'package:news_app/components/text_component.dart';

import '../screens/signup_screen.dart';
import 'primary_button_component.dart';

class AuthComponent extends StatelessWidget {
  final String? secondaryText;
  final String? linkText;
  final Function()? onLinkTextClick;
  final String? primaryText;
  final Function()? onPrimaryClick;
  final String? orText;
  final Color? primaryButtonColor;
  const AuthComponent(
      {Key? key, this.primaryButtonColor, this.orText, this.linkText, this.onLinkTextClick, this.primaryText, this.onPrimaryClick, this.secondaryText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButtonComponent(
          onPrimaryClick: onPrimaryClick,
          primaryText: primaryText,
          color: primaryButtonColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            orText ?? "OR",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Facebook",
                      style: TextStyle(fontFamily: "fb", fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Twitter",
                      style: TextStyle(fontFamily: "twitter", fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextComp(text: secondaryText ?? "NA"),
        GestureDetector(
          onTap: onLinkTextClick,
          child: Align(
            child: Text(
              linkText ?? "NA",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
