import 'package:essay_app_login/login_widget.dart';
import 'package:essay_app_login/Signup_widget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(onClickedSignUp: toggle)
      : SignupWidget(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
