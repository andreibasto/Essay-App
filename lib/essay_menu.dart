import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:essay_app_login/delete_project_page.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60,),
            const Text('Essays',
              style: TextStyle(
              fontSize: 40,
              ),
            ),
            ElevatedButton(
              child: const Text('Sign out'),
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
            ElevatedButton(
              child: const Text('Temporary button'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecoverDeletedProjects()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
