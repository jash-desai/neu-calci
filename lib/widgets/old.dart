import 'package:flutter/material.dart';

class OldContainer extends StatelessWidget {
  final Widget child;
  final double bevel;

  const OldContainer({
    Key? key,
    required this.child,
    this.bevel = 2.0,
  }) : super(key: key);
  // const NeumorphicContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: bevel, color: Colors.white),
          left: BorderSide(width: bevel, color: Colors.white),
          right: BorderSide(width: bevel, color: Colors.black),
          bottom: BorderSide(width: bevel, color: Colors.black),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: bevel, color: const Color(0xFFDFDFDF)),
            left: BorderSide(width: bevel, color: const Color(0xFFDFDFDF)),
            right: BorderSide(width: bevel, color: const Color(0xFF7F7F7F)),
            bottom: BorderSide(width: bevel, color: const Color(0xFF7F7F7F)),
          ),
          color: const Color(0xFFBFBFBF),
        ),
        child: child,
      ),
    );
  }
}
