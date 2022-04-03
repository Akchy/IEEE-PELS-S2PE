import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ieee_pels/firebase/auth.dart';
import 'package:ieee_pels/views/home_view/home_view.dart';
import 'package:ieee_pels/views/login_view/login_view.dart';
import 'package:ieee_pels/views/profile/profile_view.dart';
import 'package:ieee_pels/views/signup_view/signup_view.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
        apiKey: "AIzaSyDHA3C7A_Pwhd1KA9q0qgvBCN-Xobidp5I",
        authDomain: "ieee-pels-s2pe.firebaseapp.com",
        projectId: "ieee-pels-s2pe",
        storageBucket: "ieee-pels-s2pe.appspot.com",
        messagingSenderId: "1006536010243",
        appId: "1:1006536010243:web:3e9cf743a329fc01993c36",
        measurementId: "G-RL77H03WF8"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future getUserInfo() async {
    await getUser();
    setState(() {});
    //print('uid: $uid');
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeView.route,
      routes: {
        HomeView.route: (context) => const HomeView(),
        LoginView.route: (context) => const LoginView(),
        SignUpView.route: (context) => const SignUpView(),
        ProfileView.route: (context) => const ProfileView(),
      },
      title: 'IEEE PELS S2PE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
