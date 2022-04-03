import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> loggedIn() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool authSignedIn = prefs.getBool('auth') ?? false;
  return authSignedIn;
}

int? validateEmail( TextEditingController textEditingController) {
  var value = textEditingController.text.trim();
  if (value.isEmpty) {
    return 0; //'Email can\'t be empty'
  } else if (!value.contains(RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
    return -1; //'Enter a correct email address'
  }
  return 1;
}

