import 'package:delivery_app/data/intro_screen_datas.dart';
import 'package:delivery_app/pages/registeration_page.dart';
import 'package:delivery_app/utils/palettes.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  static const RouteName = '/splash_screen';

  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _buildIntroPage(),
            SizedBox(
              height: 40,
            ),
            _submitButton(red, "Anmelden", ""),
            SizedBox(
              height: 20,
            ),
            _submitButton(
                stormCloud, "Registrieren", RegistrationPage.RouteName),
            SizedBox(
              height: 20,
            ),
            Text('Als Gast bestellen')
          ],
        ),
      ),
    );
  }

  Widget _buildIntroPage() {
    return (Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: IntroductionScreen(
        globalBackgroundColor: white,
        pages: getPages(),
        onDone: () {
          // When done button is press
        },
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: true,
        skip: const Text(''),
        next: const Text(''),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: black,
            color: black,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    ));
  }

  Widget _submitButton(Color color, String text, String pageRouteName) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, pageRouteName);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withAlpha(50),
                  offset: Offset(2, 4),
                  blurRadius: 2,
                  spreadRadius: 10)
            ],
            color: color),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: white),
        ),
      ),
    );
  }
}
