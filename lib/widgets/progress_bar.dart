
import 'package:flutter/material.dart';
import 'package:prayer_app/style/colors.dart';

class ProgressBar extends StatefulWidget {
  final double percentFilled;

  const ProgressBar({super.key, required this.percentFilled});

  @override
  State<StatefulWidget> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    // TODO decouple hard coded padding offset ?
    double progressFilled = (screenWidth - (40 + 44)) * widget.percentFilled;
    if(progressFilled < 5) {
      progressFilled = 5;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: ThemeColors.secondary,
            height: 5,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: ThemeColors.accent,
            height: 5,
            width: progressFilled,
          ),
        )
      ]),
    );
  }
}
