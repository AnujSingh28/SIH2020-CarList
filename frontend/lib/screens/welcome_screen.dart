import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:sih2020/screens/login_screen.dart';
import '../components/rounded_button.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String screenID = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: CurvePainter(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'appLogo',
                      child: Icon(
                        Icons.local_gas_station,
                        size: 100.0,
                        color: Colors.blue.shade200,
                      ),
                    ),
                    Text(
                      'Fuelio',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 37.0,
              ),
              RoundedButton(
                text: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.screenID);
                },
                color: Color(0xfff5f9fa),
              ),
              RoundedButton(
                text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.screenID);
                },
                color: Color(0xfff5f9fa)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {

  final double midHeight;

  CurvePainter({
    this.midHeight = 0.65
  });

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    Paint paint = Paint();

    Path curve = Path();
    paint.shader = ui.Gradient.linear(
        Offset(0, height * 0.5),
        Offset(0, height),
        <Color>[Colors.lightBlueAccent, Colors.blue.shade900]);
    paint.style = PaintingStyle.fill;
    curve.moveTo(0, height * (midHeight+0.1));
    curve.quadraticBezierTo(
        width * 0.2, height * (midHeight-0.025), width * 0.5, height * midHeight);
    curve.quadraticBezierTo(width * 0.8, height * (midHeight+0.025), width, height * (midHeight-0.1));
    curve.lineTo(width, height);
    curve.lineTo(0, height);
    canvas.drawPath(curve, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
