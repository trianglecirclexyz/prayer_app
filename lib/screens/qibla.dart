
import 'package:flutter/material.dart';


class Qibla extends StatefulWidget {
  const Qibla({Key? key}) : super(key: key);

  @override
  QiblaState createState() => QiblaState();
}

class QiblaState extends State<Qibla> {



  @override
  Widget build(BuildContext context) {

    // TODO obviously just a test, reimplement qibla later
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Center(
              child: Container(
                height: 120,
                width: 120,
                color: Colors.blue,
              )
          ),
        ),
      ),
    );
  }
}
