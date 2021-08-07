import 'dart:async';
// import 'dart:developer';
import 'package:delivery_app/pages/registeration_page.dart';
import 'package:delivery_app/pages/splash_page.dart';
import 'package:delivery_app/pages/start_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: StartPage.RouteName,
      routes: {
        StartPage.RouteName: (_) => StartPage(),
        SplashScreen.RouteName: (_) => SplashScreen(),
        RegistrationPage.RouteName: (_) => RegistrationPage()
      },
    );
  }
}
