import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:essay_app_login/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Resetpasswordwidget extends StatefulWidget {
  const Resetpasswordwidget({Key? key}) : super(key: key);

  @override
  State<Resetpasswordwidget> createState() => _ResetpasswordwidgetState();
}

class _ResetpasswordwidgetState extends State<Resetpasswordwidget> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 90,),
            Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
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
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ResetPassword();
                },
                child: Text('Reset'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Back')),
            )

          ],
        ),
      ),
    );

  }

  Future ResetPassword() async{
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      print('Password reset email sent');
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);    }
  }

}
