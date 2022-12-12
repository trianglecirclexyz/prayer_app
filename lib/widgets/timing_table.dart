import 'package:flutter/material.dart';

import '../prayer_timings.dart';
import '../widgets/timing_card.dart';

class TimingTable extends StatefulWidget {
  const TimingTable({super.key});

  @override
  State<StatefulWidget> createState() => _TimingTableState();
}

class _TimingTableState extends State<TimingTable>
    with SingleTickerProviderStateMixin {
  late Future<List<Prayer>> prayers;
  PrayerTimings prayerTimings = PrayerTimings();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildTimeTable(prayerTimings);
  }

  Widget buildTimeTable(PrayerTimings prayerTimings) {
    // Future<List<Prayer>> prayers;
    PrayerTimings prayerTimings = PrayerTimings();
    // prayers = prayerTimings.calculatePrayerTimings(
    //     1, 1, DateTime.now(), Madhab.shafi, Method.northAmerica);

    List<Widget> cards = [];

    // TODO calculate prayer status here

    return FutureBuilder<List<Prayer>>(
      future: prayerTimings.calculatePrayerTimings(
          1, 1, DateTime.now(), Madhab.shafi, Method.northAmerica),
      builder: (BuildContext context, AsyncSnapshot<List<Prayer>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text("None");

          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Text("Loading");

          case ConnectionState.done:
            if (snapshot.hasData) {
              for (Prayer prayer in snapshot.data!) {
                cards.add(TimingCard(
                    prayer: prayer, prayerStatus: PrayerStatus.upcoming));
              }
            }
            print("Snapshot has data? ${snapshot.hasData}");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cards,
            );

          default:
            return const Text("Default");
        }
      },
    );
  }
}
