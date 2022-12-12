
import 'package:flutter/material.dart';



class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {

    // TODO obviously just a test, reimplement settings later
    return Scaffold(
      body: SafeArea(
          child: Container(
            color: Colors.black,
            child: Center(
              child: Container(
                height: 120,
                width: 120,
                color: Colors.red,
              )
            ),
          ),
      ),
    );
  }
}

