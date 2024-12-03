import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckWidget extends StatelessWidget {
  final String checkTitle;
  bool isPassword8Chars;
  bool hasDigit;
  bool hasUpperCase;
  bool hasLowerCase;
  bool hasSpecialCharacters;
  CheckWidget({
    super.key,
    required this.checkTitle,
    this.isPassword8Chars = false,
    this.hasDigit = false,
    this.hasUpperCase = false,
    this.hasLowerCase = false,
    this.hasSpecialCharacters = false,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.01),
      child: Row(
        children: [
          Container(
            width: screenSize.width * 0.065,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (isPassword8Chars ||
                      hasDigit ||
                      hasUpperCase ||
                      hasLowerCase ||
                      hasSpecialCharacters)
                  ? Colors.green
                  : Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 189, 189, 189),
              ),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 23,
            ),
          ),
          SizedBox(width: screenSize.width * 0.03),
          Text(
            checkTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
