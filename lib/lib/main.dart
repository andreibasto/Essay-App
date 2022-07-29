import 'package:essay_app_login/login_widget.dart';
import 'package:essay_app_login/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// final navigatorkey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static final String title = 'FireBase Auth';

  @override
  Widget build(BuildContext context) => MaterialApp(
        //navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: MainPage(),
  );
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold (
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProfileScreen();
        } else {
          return LoginWidget();
        }
      },
    ),
  );
}

