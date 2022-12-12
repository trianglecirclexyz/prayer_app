import 'package:flutter/material.dart';
import 'package:prayer_app/style/custom_icons.dart';
import 'package:prayer_app/style/colors.dart';
import 'package:prayer_app/widgets/fade_button.dart';
import 'package:prayer_app/widgets/progress_bar.dart';
import 'package:prayer_app/widgets/timing_table.dart';

import '../widgets/fade_widget_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late ProgressBar progressBar;

  @override
  void initState() {
    super.initState();
  }

  // TODO change placeholders to actual
  String city = 'Davis';
  String date = 'Saturday, September 3rd, 2022';
  String hijriDate = 'Safar 7, 1444 AH';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  height: 84,
                  child: Center(
                    child: Text(
                      city,
                      style: const TextStyle(
                          fontSize: 34,
                          color: ThemeColors.accent,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 64,
                      color: ThemeColors.main,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FadeButton(
                            iconData: CustomIcons.left_arrow,
                            onPressedCallback: () {
                              print('left');
                            }, // TODO
                          ),
                          FadeWidgetButton(
                            childWidget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  date,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: ThemeColors.primaryText,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto'),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  hijriDate,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: ThemeColors.primaryText,
                                      fontFamily: 'Roboto'),
                                ),
                              ],
                            ),
                            onPressedCallback: () {
                              print('Calendar');
                            },
                          ),
                          FadeButton(
                            iconData: CustomIcons.right_arrow,
                            onPressedCallback: () {}, // TODO
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // TODO progress bar
                      Text(
                        'Maghrib in 46 minutes',
                        style: TextStyle(
                            fontSize: 14,
                            color: ThemeColors.primaryText,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                      ProgressBar(
                        percentFilled: 0,
                      )
                    ],
                  ),
                ),
              ),
              const Flexible(flex: 9, child: TimingTable())
            ],
          ),
        ),
      ),
    );
  }
}
