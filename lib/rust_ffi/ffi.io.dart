import 'dart:ffi';
import 'dart:io';
import 'package:prayer_app/rust_ffi/bridge_generated.dart';

const base = 'prayer_timings_api';
final path = Platform.isWindows ? "$base.dll" : "lib$base.so";
final dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open(path);

final api = PrayerTimingsApiImpl(dylib);
