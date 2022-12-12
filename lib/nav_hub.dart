import 'package:flutter/material.dart';
import 'package:prayer_app/screens/home.dart';
import 'package:prayer_app/screens/qibla.dart';
import 'package:prayer_app/screens/settings.dart';
import 'package:prayer_app/style/colors.dart';
import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';

class NavHub extends StatefulWidget {
  const NavHub({Key? key}) : super(key: key);

  @override
  NavHubState createState() => NavHubState();
}

class NavHubState extends State<NavHub> with WidgetsBindingObserver {

  // checks to see if setting has changed and reloads data if required
  // (sends to loading screen for reload of data)
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }
  // @override
  // void dispose() {
  //   super.dispose();
  //   WidgetsBinding.instance.removeObserver(this);
  // }
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.resumed) {
  //     setState(() {
  //       Navigator.pushReplacementNamed(context, '/');
  //     });
  //   }
  // }

  int currIndex = 0;
  List<Widget> screens = <Widget>[
    const Home(),
    const Qibla(),
    const Settings(),
  ];

  void onTap(int index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBarPageTransition(
        builder: (_, currIndex) => screens.elementAt(currIndex),
        currentIndex: currIndex,
        totalLength: screens.length,
        transitionType: TransitionType.slide,
        transitionDuration: const Duration(milliseconds: 200),
        transitionCurve: Curves.ease,
      ),
      bottomNavigationBar:
      Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          selectedItemColor: ThemeColors.accent,
          unselectedItemColor: ThemeColors.primaryText,
          items:
          const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Timings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_up),
              label: 'Qibla',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: currIndex,
          onTap: onTap,
          elevation: 0.0,
          backgroundColor: ThemeColors.main,
        ),
      ),
    );
  }
}