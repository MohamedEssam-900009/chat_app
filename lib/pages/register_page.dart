import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custome_button.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static String id = 'registerPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
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
              hintText: 'Email',
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextField(
              hintText: 'Password',
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomButton(
              text: 'REGISTER',
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'have an account',
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
}
