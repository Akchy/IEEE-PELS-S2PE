import 'package:flutter/material.dart';
import 'package:ieee_pels/widgets/navbar/navbar_desktop_tablet.dart';
import 'package:ieee_pels/widgets/singup/signup_page.dart';

class SignUpView extends StatelessWidget {
  static const String route = '/signup';
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            NavbarDesktopTablet(),
            SignUpWidget(),
          ],
        ),
      ),
    );
  }
}
