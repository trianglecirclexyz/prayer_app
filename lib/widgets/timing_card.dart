
import 'package:flutter/material.dart';

import '../prayer_timings.dart';
import '../style/colors.dart';

class TimingCard extends StatefulWidget {
  final Prayer prayer;
  final PrayerStatus prayerStatus;

  const TimingCard(
      {super.key,
      required this.prayer,
      required this.prayerStatus});

  @override
  State<StatefulWidget> createState() => _TimingCardState();
}

class _TimingCardState extends State<TimingCard>
    with SingleTickerProviderStateMixin {
  late String formattedPrayerTime;

  // vars that control the card style
  Color outlineColor = ThemeColors.background;
  double outlineWeight = 0.5;
  Color fontColor = ThemeColors.primaryText;
  FontWeight fontWeight = FontWeight.w400;


  @override
  void initState() {
    super.initState();

    // format the time of prayer
    int hour = widget.prayer.prayerTime.hour;
    int minute = widget.prayer.prayerTime.minute;
    String meridiem = 'AM';
    if (hour > 12) {
      hour -= 12;
      meridiem = 'PM';
    }
    String minuteString = minute.toString();
    if (minute < 10) {
      minuteString = '0$minute';
    }
    formattedPrayerTime = '$hour:$minuteString $meridiem';

    // determine card styling depending on prayer status
    switch (widget.prayerStatus) {
      case PrayerStatus.upcoming:
        break;
      case PrayerStatus.ongoing:
        {
          fontColor = ThemeColors.accent;
          outlineColor = fontColor;
          outlineWeight = 1.5;
          fontWeight = FontWeight.w600;
        }
        break;
      case PrayerStatus.passed:
        {
          fontColor = ThemeColors.secondary;
          outlineColor = ThemeColors.secondary;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: outlineColor, width: outlineWeight),
        borderRadius: BorderRadius.circular(15),
      ),
      color: ThemeColors.background,
      elevation: 0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: ThemeColors.main,
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                widget.prayer.prayerName,
                style: TextStyle(
                    fontSize: 16,
                    color: fontColor,
                    fontWeight: fontWeight,
                    fontFamily: 'Roboto'),
              ),
              Text(
                formattedPrayerTime,
                style: TextStyle(
                    fontSize: 16,
                    color: fontColor,
                    fontWeight: fontWeight,
                    fontFamily: 'Roboto'),
              )
            ]),
          )
      ),
    );
  }
}

enum PrayerStatus { upcoming, ongoing, passed }
