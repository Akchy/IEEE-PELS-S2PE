import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_pels/firebase/auth.dart';
import 'package:ieee_pels/views/login_view/login_view.dart';
import 'package:ieee_pels/widgets/functions/functions.dart';
import 'package:ieee_pels/widgets/navbar/navbar_logo.dart';

class NavbarDesktopTablet extends StatefulWidget {
  const NavbarDesktopTablet({Key? key}) : super(key: key);

  @override
  State<NavbarDesktopTablet> createState() => _NavbarDesktopTabletState();
}

class _NavbarDesktopTabletState extends State<NavbarDesktopTablet> {

  bool logIn = false;

@override
  void initState()  {
  checkLoggedIn();
  super.initState();
  }

  void checkLoggedIn()async{
    logIn = await loggedIn() ;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    checkLoggedIn();
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.red[700],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const NavbarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //NavbarItem(item: 'Episodes'),
              const SizedBox(
                width: 60,
              ),
              logIn? _logoutButton(context) : _loginButton(context),
            ],
          )
        ],
      ),
    );
  }

  Widget _loginButton(var context) {
    String? _routeName = ModalRoute.of(context)!.settings.name;
    bool _isLogin = _routeName == '/login' ? true : false;
    Widget loginButton = MaterialButton(
      highlightColor: Colors.grey[900],
      onPressed: () {
        if (!_isLogin) Navigator.pushNamed(context, LoginView.route);
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      elevation: 5.0,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Text('Log In',
            style: GoogleFonts.roboto(fontSize: 16.0, color: Colors.white)),
      ),
    );

    return loginButton;
  }

  Widget _logoutButton(var context) {

    Widget loginButton = MaterialButton(
      highlightColor: Colors.grey[900],
      onPressed: () async{
        await signOut();
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      elevation: 5.0,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Text('Log Out',
            style: GoogleFonts.roboto(fontSize: 16.0, color: Colors.white)),
      ),
    );

    return loginButton;
  }
}
