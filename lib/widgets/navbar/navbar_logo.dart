import 'package:flutter/material.dart';
import 'package:ieee_pels/views/home_view/home_view.dart';

class NavbarLogo extends StatelessWidget {
  const NavbarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _routeName = ModalRoute.of(context)!.settings.name;
    bool _isHome = _routeName == '/' ? true : false;
    return MouseRegion(
      cursor: _isHome ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (!_isHome) Navigator.pushNamed(context, HomeView.route);
        },
        child: const SizedBox(
          height: 70,
          width: 180,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Image(image: AssetImage('assets/images/ieee_logo.png')),
          ),
        ),
      ),
    );
  }
}
