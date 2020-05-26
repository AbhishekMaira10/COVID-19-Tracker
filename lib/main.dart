import 'package:covid_19_tracker/models/constants.dart';
import 'package:covid_19_tracker/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final _navigatorkey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: _navigatorkey,
      theme: WiredashThemeData(
        primaryColor: Colors.blueAccent,
        secondaryColor: Colors.orangeAccent,
        dividerColor: Colors.blue,
      ),
      projectId: projectId,
      secret: secretkey,
      child: MaterialApp(
        navigatorKey: _navigatorkey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Circular",
        ),
        home: IntroPage(),
      ),
    );
  }
}
