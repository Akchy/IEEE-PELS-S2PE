import 'package:flutter/material.dart';
import 'package:ieee_pels/widgets/home/landing_page.dart';
import 'package:ieee_pels/widgets/navbar/navbar_desktop_tablet.dart';

class HomeView extends StatelessWidget {
  static const String route = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            NavbarDesktopTablet(),
            LandingPage(),
          ],
        ),
      ),
    );
  }
}
