import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {

  final Color color;
  final Function onPressed;
  final String text;
  final Color textColor;

  RoundedButton({
    this.color = Colors.white,
    @required this.text,
    @required this.onPressed,
    this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.0,
        top: 8.0
      ),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}