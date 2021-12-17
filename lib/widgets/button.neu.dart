import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'unary.neu.dart';

class NeuNumButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;
  final int flex;
  final Color textColor;
  const NeuNumButton({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
    this.flex = 1,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color whiteColor = Colors.white;
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 18,
        ),
        child: NeumorphicButtonUnary(
          useSize: false,
          bevel: color == whiteColor ? 5 : 5,
          radius: 20,
          color: color,
          child: Center(
            child: SizedBox(
              height: 50,
              child: Text(
                text,
                style: TextStyle(
                  // fontFamily: GoogleFonts.rajdhani().fontFamily,
                  // fontFamily: GoogleFonts.exo().fontFamily,
                  fontFamily: GoogleFonts.spaceMono().fontFamily,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
