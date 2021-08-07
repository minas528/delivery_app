import 'dart:async';

import 'package:delivery_app/pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatefulWidget {
  static const RouteName = '/start_page';

  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var _visibleWidget = 'scooter_animation';
  double position = -200;
  var animationGoing = true;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        /// Moving the horizotal position of the
        /// scooter by one until it reachs the middle
        if (animationGoing) {
          position += 1;
        }
        if (_getWidth() / 2 - 100 <= position) {
          _visibleWidget = 'brand_text';
          animationGoing = false;

          /// After showing the brand name for 3 seconds
          /// this will navigate to the next page
          new Future.delayed(const Duration(seconds: 3),
              () => Navigator.pushNamed(context, SplashScreen.RouteName));
        }
      });
    });
  }

  /// This function returns the Width of the device
  double _getWidth() {
    return MediaQuery.of(context).size.width;
  }

  /// This function returns the Height of the device
  double _getHeight() {
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _visibleWidget == 'scooter_animation'
            ? _getAnimatedScooter()
            : _getBrandText(),
      ]),
    );
  }

  /// This Function returns a widget
  /// Which animates the scooter image
  /// from left to right
  Widget _getAnimatedScooter() {
    return (AnimatedPositioned(
      left: position,
      top: _getHeight() / 2 - 100,
      height: 100,
      child: Image.asset(
        "images/delivery.png",
        width: 100,
        height: 100,
      ),
      duration: Duration(milliseconds: 5),

      // right: 1000,
      width: MediaQuery.of(context).size.width,
    ));
  }

  /// This function return a widget containg
  /// a text with the brand name
  Widget _getBrandText() {
    return (Positioned(
        bottom: _getHeight() / 2,
        left: _getWidth() * 0.4,
        // duration: Duration(milliseconds: 200),
        child: Center(
            child: Text(
          'Brand',
          style:
              GoogleFonts.graduate(fontSize: 30, fontWeight: FontWeight.bold),
        ))));
  }
}
