import 'package:air_quality_app/app/pages/home_screen.dart';
import 'package:air_quality_app/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:air_quality_app/resources/constants.dart' show Strings;
import 'package:flutter/services.dart';

class AeroWeatherMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(Theme.of(context)),
      home: HomeScreen(),
    );
  }
}

/// TODO
///   add action for city deletes in ManageCities Screen
///   use Set wherever possible changing List
///
