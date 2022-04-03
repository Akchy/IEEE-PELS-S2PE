import 'package:flutter/material.dart';
import 'package:ieee_pels/widgets/login/login_page.dart';
import 'package:ieee_pels/widgets/navbar/navbar_desktop_tablet.dart';

class LoginView extends StatelessWidget {
  static const String route = '/login';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            NavbarDesktopTablet(),
            LoginWidget(),
          ],
        ),
      ),
    );
  }
}
