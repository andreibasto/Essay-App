import 'package:essay_app_login/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({required this.onClickedSignUp, Key? Key,}) ;
      // : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool ispasswordandemailfound = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Essay App',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
          ),
          const Text('Sign in',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 44,
          ),
          Container(
            child: ispasswordandemailfound ?
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ) :
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffd32f2f),
                      width: 1,
                    ),
                  ),
                    labelText: 'User Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffd32f2f),
                        width: 2,
                      ),
                    ),
                ),
              ),
          ),
          SizedBox(height: 26,
          ),
          Container(
            child: ispasswordandemailfound ?
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              )        :
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: "Password or email is incorrect",
                ),
              ),
          ),
          TextButton(
            onPressed: () {
              print("too bad");
              //forgot password screen thing
            },
            child: const Text('Forgot Password?',),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                  color: Colors.black,
              ),
              text: "  Don't have an account?  ",
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignUp,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  text: 'Sign up',
                ),
              ],
            ),
          ),

          const SizedBox(height: 70,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color(0xFF0069FE),
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                signIn();
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }

  Future signIn() async {

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      ispasswordandemailfound = false;
      print(e);
      runApp(MyApp());
    }
  }
}
