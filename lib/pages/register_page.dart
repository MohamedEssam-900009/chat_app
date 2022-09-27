import 'package:chat_app/constats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custome_button.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  static String id = 'registerPage';
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 75.0,
            ),
            Image.asset(
              'assets/images/chat_logo.png',
              height: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Chat App',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: 'pacifico',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 75.0,
            ),
            Row(
              children: const [
                Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextField(
              onChanged: (data) {
                email = data;
              },
              hintText: 'Email',
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextField(
              onChanged: (data) {
                password = data;
              },
              hintText: 'Password',
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomButton(
              onTap: () async {
                try {
                  await registerUser();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    showSnackBar(context, 'The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    showSnackBar(
                        context, 'The account already exists for that email.');
                  }
                }
                showSnackBar(context, 'Success');
              },
              text: 'REGISTER',
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account ?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    '   Login',
                    style: TextStyle(
                      color: Color(0xffC7EDE6),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
