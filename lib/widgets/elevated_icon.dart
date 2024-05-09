import 'package:flutter/material.dart';

class ElevatedIcon extends StatelessWidget {
  const ElevatedIcon({
    super.key,
    required this.iconData,
    this.size = 100,
    this.padding = 16,
    this.borderRadius = 15,
    this.color = Colors.black12,
  });

  final IconData iconData;
  final double size;
  final double padding;
  final double borderRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Icon(
            iconData,
            size: size,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
