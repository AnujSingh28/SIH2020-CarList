import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final Function onPressed;

  RoundIcon({
    this.iconColor = Colors.blue,
    this.size = 27.0,
    @required this.icon,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(40.0),
      splashColor: Colors.blueAccent,
      highlightColor: Colors.green.withOpacity(0.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: Colors.blue,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            icon,
            color: iconColor,
            size: size,
          ),
        ),
      ),
    );
  }
}
