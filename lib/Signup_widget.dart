import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:essay_app_login/Utils.dart';


class SignupWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignupWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            'Sign up',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid Email'
                    :null,
          ),
          SizedBox(height: 26,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: ('Password')
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length < 6
              ? 'Password must be at least 6 characters long'
              : null,
          ),

          TextButton(
            onPressed: () {
              signUp();
            },
            child: const Text('Sign Up'),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
              ),
              text: 'Already have an account?  ',
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignIn,
                  text: " Log In"
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Future signUp() async{
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
  }

}
