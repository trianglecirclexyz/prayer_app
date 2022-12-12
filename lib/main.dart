import 'package:flutter/material.dart';
import 'package:prayer_app/nav_hub.dart';
import 'package:prayer_app/screens/loading.dart';
import 'package:prayer_app/style/colors.dart';

void main() => runApp(
    MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: ThemeColors.background),
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/nav_hub': (context) => const NavHub(),
      }
    )
);
