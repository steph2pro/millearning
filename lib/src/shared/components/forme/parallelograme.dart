import 'package:flutter/material.dart';
class Parallelograme extends StatelessWidget {
  final double width;
  final double height;
  final Color startColor;
  final Color endColor;

  const Parallelograme({
    Key? key,
    required this.width,
    required this.height,
    required this.startColor,
    required this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: ParallelogramePainter(
          startColor: startColor,
          endColor: endColor,
        ),
      ),
    );
  }
}

class ParallelogramePainter extends CustomPainter {
  final Color startColor;
  final Color endColor;

  ParallelogramePainter({required this.startColor, required this.endColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [startColor, endColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;
 Path path = Path()
      ..moveTo(0, size.height*0.1) // Coin haut gauche (plus haut)
      ..lineTo(size.width,  size.height*0.35) // Coin haut droit (plus bas)
      ..lineTo(size.width, size.height) // Coin bas droit (plus haut)
      ..lineTo(size.width * 0.2, size.height*1.3) // Coin bas gauche (plus bas)
      ..close(); // Fermer le chemin

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}