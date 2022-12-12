import 'package:prayer_app/rust_ffi/ffi.io.dart';

class PrayerTimings {
  late Prayer fajr;
  late Prayer sunrise;
  late Prayer dhur;
  late Prayer asr;
  late Prayer magrhib;
  late Prayer isha;
  late Prayer fajrTomorrow;

  PrayerTimings();

  Future<List<Prayer>> calculatePrayerTimings(double lat, double lon, DateTime date,
      Madhab madhab, Method method) async {

    int madhabCode = 0;
    switch (madhab) {
      case Madhab.shafi:
        {
          madhabCode = 0;
        }
        break;

      case Madhab.hanafi:
        {
          madhabCode = 1;
        }
        break;

      default:
        {
          madhabCode = 0;
        }
        break;
    }

    int methodCode = 6;
    switch (method) {
      case Method.muslimWorldLeague:
        {
          methodCode = 0;
        }
        break;

      case Method.egyptian:
        {
          methodCode = 1;
        }
        break;
      case Method.karachi:
        {
          methodCode = 2;
        }
        break;
      case Method.ummAlQura:
        {
          methodCode = 3;
        }
        break;
      case Method.dubai:
        {
          methodCode = 4;
        }
        break;
      case Method.moonsightingCommittee:
        {
          methodCode = 5;
        }
        break;
      case Method.northAmerica:
        {
          methodCode = 6;
        }
        break;
      case Method.kuwait:
        {
          methodCode = 7;
        }
        break;
      case Method.qatar:
        {
          methodCode = 8;
        }
        break;
      case Method.singapore:
        {
          methodCode = 9;
        }
        break;

      default:
        {
          madhabCode = 6;
        }
        break;
    }

    List<String> prayerTimingsData = (await api.getPrayerTimings(
            lat: lat,
            lon: lon,
            day: date.day,
            month: date.month,
            year: date.year,
            madhab: madhabCode,
            method: methodCode))
        .split('\n');

    fajr = Prayer('Fajr', DateTime.parse(prayerTimingsData[0]));
    sunrise = Prayer('Sunrise', DateTime.parse(prayerTimingsData[1]));
    dhur = Prayer('Dhur', DateTime.parse(prayerTimingsData[2]));
    asr = Prayer('Asr', DateTime.parse(prayerTimingsData[3]));
    magrhib = Prayer('Magrhib', DateTime.parse(prayerTimingsData[4]));
    isha = Prayer('Isha', DateTime.parse(prayerTimingsData[5]));
    fajrTomorrow = Prayer('Fajr', DateTime.parse(prayerTimingsData[6]));

    print(
        "${fajr.prayerTime}, ${sunrise.prayerTime}, ${dhur.prayerTime}, ${asr.prayerTime}, ${magrhib.prayerTime}, ${isha.prayerTime}");

    return [fajr, sunrise, dhur, asr, magrhib, isha];
  }

}

class Prayer {
  String prayerName;
  DateTime prayerTime;

  Prayer(this.prayerName, this.prayerTime);
}

enum Madhab { shafi, hanafi }

enum Method {
  muslimWorldLeague,
  egyptian,
  karachi,
  ummAlQura,
  dubai,
  moonsightingCommittee,
  northAmerica,
  kuwait,
  qatar,
  singapore,
}
