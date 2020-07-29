import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih2020/screens/welcome_screen.dart';

class SideMenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Smarth Bansal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0
                    ),
                  ),
                  Text(
                    'sb66@iitbbs.ac.in',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0
                    ),
                  )
                ],
              )
          ),
          SideMenuListTile(
            icon: FontAwesomeIcons.user,
            text: "Account",
            onTap: () {

            },
          ),
          Divider(),
          SideMenuListTile(
            icon: FontAwesomeIcons.history,
            text: "Travel History",
            onTap: () {

            },
          ),
          Divider(),
          SideMenuListTile(
            icon: FontAwesomeIcons.signOutAlt,
            text: "Sign Out",
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(WelcomeScreen.screenID));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

class SideMenuListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  SideMenuListTile({this.icon,this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
          icon
      ),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 18.0
        ),
      ),
    );
  }
}
