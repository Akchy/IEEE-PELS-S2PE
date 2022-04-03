import 'package:flutter/material.dart';
import 'package:ieee_pels/widgets/navbar/navbar_desktop_tablet.dart';
import 'package:ieee_pels/widgets/profile/profile_page.dart';

class ProfileView extends StatelessWidget {
  static const String route = '/profile';
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            NavbarDesktopTablet(),
            ProfileWidget(),
          ],
        ),
      ),
    );
  }
}
