import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  // initializes the prayer time data called from the API/loaded from cache
  // and then navigates to the home screen when the data is loaded
  void initData() async {
    // navigation and data transfer to the home screen
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, '/nav_hub');
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Center(child: Text('Insert Loading Animation Here')))
        // TODO loading screen
        );
  }
}
