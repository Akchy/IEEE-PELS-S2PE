import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_pels/firebase/auth.dart';
import 'package:ieee_pels/views/home_view/home_view.dart';
import 'package:ieee_pels/views/profile/profile_view.dart';
import 'package:ieee_pels/views/signup_view/signup_view.dart';
import 'package:ieee_pels/widgets/functions/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  late FocusNode textFocusNodeEmail,textFocusNodePassword;
  bool passwordVisible = false;

  @override
  void initState() {
    _emailController.text='';
    _passController.text='';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    checkLoggedIn();
    super.initState();
  }

  void checkLoggedIn() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;
    if(authSignedIn) Navigator.pushReplacementNamed(context, ProfileView.route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height - 70,
        width: MediaQuery.of(context).size.width,
        child: Material(
          elevation: 25,
          child: Wrap(
            children: [
              Container(
                width: 500,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text('PELS S2PE',
                            style: GoogleFonts.roboto(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                      _emailTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _passwordTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _loginButton(),
                      const SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey[800],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _signUpButton(),
                    ]),
              ),
            ],
          ),
        ));
  }

  Widget _emailTextField() {
    return TextField(
      controller: _emailController,
      focusNode: textFocusNodeEmail,
      textInputAction: TextInputAction.next,
      autofocus: false,
      onSubmitted: (value) {
        textFocusNodeEmail.unfocus();
        FocusScope.of(context).requestFocus(textFocusNodePassword);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email Address',
        hintStyle: const TextStyle(fontSize: 13),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return TextField(
      controller: _passController,
      focusNode: textFocusNodePassword,
      obscureText: !passwordVisible,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(fontSize: 13),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: passwordVisible ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.maxFinite,
      child: MaterialButton(
        onPressed: ()async {
          var validate = validateEmail(_emailController);
          if(validate==1){
            var user =await signInWithEmailPassword(
                _emailController.text,
                _passController.text)
                .then((result) {
              if (result != null) {
                print('result:$result');
                Navigator.popUntil(context, ModalRoute.withName(HomeView.route));
              }
              else
                print('No result');
            }).catchError((error) {
              print('Registration Error: $error');
            });
          }
          else if(validate==-1) print('Enter valid Email');
          else print('Email Empty');
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        elevation: 5.0,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text('Log In',
              style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return SizedBox(
      child: MaterialButton(
        onPressed: () => Navigator.pushNamed(context, SignUpView.route),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        elevation: 5.0,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Sign Up',
              style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white)),
        ),
      ),
    );
  }
}
