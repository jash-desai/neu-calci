import 'package:flutter/material.dart';

class NeumorphicButtonUnary extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Color? color;
  final bool useSize;
  final double height;
  final double width;
  final double radius;
  final Offset blurOffset;
  final VoidCallback onPressed;

  NeumorphicButtonUnary({
    Key? key,
    required this.child,
    this.bevel = 10,
    required this.color,
    this.useSize = true,
    this.height = double.infinity,
    this.width = double.infinity,
    this.radius = 0,
    required this.onPressed,
  })  : blurOffset = Offset(bevel / 1.35, bevel / 2),
        super(key: key);

  @override
  State<NeumorphicButtonUnary> createState() => _NeumorphicButtonUnaryState();
}

class _NeumorphicButtonUnaryState extends State<NeumorphicButtonUnary> {
  bool _isPressed = false;
  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).backgroundColor;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
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
                  color.mix(Colors.white, _isPressed ? 0.01 : 0.01),
                ],
                stops: const [0, 0.25, 0.75, 1],
              ),
              borderRadius: BorderRadius.circular(widget.radius),
              color: color,
              boxShadow: _isPressed
                  ? [
                      BoxShadow(
                        blurRadius: widget.bevel,
                        offset: -widget.blurOffset * 1.35,
                        color: color.mix(Colors.black, 0.3),
                      ),
                      BoxShadow(
                        blurRadius: widget.bevel,
                        offset: widget.blurOffset * 0.7,
                        color: color.mix(Colors.white, 0.3),
                      ),
                    ]
                  : [
                      BoxShadow(
                        blurRadius: widget.bevel,
                        offset: -widget.blurOffset * 0.75,
                        color: color.mix(Colors.white, 0.2),
                      ),
                      BoxShadow(
                        blurRadius: widget.bevel,
                        offset: widget.blurOffset,
                        color: color.mix(Colors.black, 0.3),
                      ),
                    ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount)!;
  }
}
