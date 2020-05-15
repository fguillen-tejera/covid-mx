import 'package:covid/Screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(CovidMex());

class CovidMex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
      theme: ThemeData(
          iconTheme: IconThemeData(
            color: Color(0xff071e3d),
          ),
          dividerColor: Color(0xff21e6c1)),
    );
  }
}
