import 'package:flutter/material.dart';

class NeumorphicButtonBinary extends StatefulWidget {
  final Widget childOn;
  final Widget childOff;
  final double bevel;
  final Color? color;
  final bool useSize;
  final double height;
  final double width;
  final double radius;
  final Offset blurOffset;

  NeumorphicButtonBinary({
    Key? key,
    required this.childOn,
    required this.childOff,
    this.bevel = 10,
    required this.color,
    this.useSize = true,
    this.height = double.infinity,
    this.width = double.infinity,
    this.radius = 0,
  })  : blurOffset = Offset(bevel / 1.35, bevel / 2),
        super(key: key);

  @override
  State<NeumorphicButtonBinary> createState() => _NeumorphicButtonBinaryState();
}

class _NeumorphicButtonBinaryState extends State<NeumorphicButtonBinary> {
  bool _isPressed = false;
  void _onPressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).backgroundColor;
    return GestureDetector(
      onTap: _onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Container(
          padding: widget.useSize
              ? EdgeInsets.symmetric(
                  horizontal: widget.width,
                  vertical: widget.height,
                )
              : const EdgeInsets.all(0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _isPressed ? color : color.mix(Colors.black, 0.01),
                _isPressed ? color.mix(Colors.black, .025) : color,
                _isPressed ? color.mix(Colors.black, .025) : color,
                color.mix(Colors.white, _isPressed ? 0.1 : 0.1),
              ],
              stops: const [0, 0.25, 0.75, 1],
            ),
            borderRadius: BorderRadius.circular(widget.radius),
            color: color,
            boxShadow: _isPressed
                ? [
                    BoxShadow(
                      blurRadius: widget.bevel,
                      offset: widget.blurOffset,
                      color: color.mix(Colors.white, 0.35),
                    ),
                    BoxShadow(
                      blurRadius: widget.bevel,
                      offset: -widget.blurOffset,
                      color: color.mix(Colors.black, 0.3),
                    ),
                  ]
                : [
                    BoxShadow(
                      blurRadius: widget.bevel,
                      offset: -widget.blurOffset,
                      color: color.mix(Colors.white, 0.35),
                    ),
                    BoxShadow(
                      blurRadius: widget.bevel,
                      offset: widget.blurOffset,
                      color: color.mix(Colors.black, 0.3),
                    ),
                  ],
          ),
          child: _isPressed ? widget.childOff : widget.childOn,
        ),
      ),
      // ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount)!;
  }
}
