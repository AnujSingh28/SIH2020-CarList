import 'package:flutter/material.dart';
import 'package:sih2020/components/rounded_button.dart';
import 'package:sih2020/components/round_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih2020/screens/login_screen.dart';
import 'package:sih2020/screens/vehicle_list_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String screenID = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Your Email",
                            hintStyle: TextStyle(
                                color: Colors.grey
                            )
                        ),
                        style: TextStyle(

                        ),
                        textAlign: TextAlign.start,
                        onChanged: (String value) {
                        },
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        cursorColor: Colors.green,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Your Password",
                            hintStyle: TextStyle(
                                color: Colors.grey
                            )
                        ),
                        style: TextStyle(

                        ),
                        textAlign: TextAlign.start,
                        onChanged: (String value) {
                        },
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        cursorColor: Colors.green,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                                color: Colors.grey
                            )
                        ),
                        style: TextStyle(

                        ),
                        textAlign: TextAlign.start,
                        onChanged: (String value) {
                        },
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      RoundedButton(
                        text: 'Register',
                        onPressed: () {
                          Navigator.pushNamed(context, VehicleListScreen.screenID);
                        },
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                      ),
                      Text(
                        "or",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
//                        decoration: TextDecoration.underline
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIcon(
                            icon: FontAwesomeIcons.facebookF,
                            onPressed: () {

                            },
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.googlePlusG,
                            onPressed: () {

                            },
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.twitter,
                            onPressed: () {

                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, LoginScreen.screenID);
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(
                                color: Colors.blue
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
