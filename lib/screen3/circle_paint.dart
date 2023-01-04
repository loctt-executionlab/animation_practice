import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({super.key, required this.circleSize});

  final double circleSize;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(circleSize: circleSize),
    );
  }
}

class CirclePainter extends CustomPainter {
  const CirclePainter({required this.circleSize});
  final double circleSize;
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawCircle(
        Offset(size.width / 2, size.width / 2), circleSize, paint1);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CirclePainter oldDelegate) => false;
}
