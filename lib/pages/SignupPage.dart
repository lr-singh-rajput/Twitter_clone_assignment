import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'Widget.dart';

class signupPage extends StatelessWidget {
  const signupPage({super.key});

  @override
  Widget build(BuildContext context) {

    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),

        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Column(
          children: [
            AppWidgets.customTextField(
              hintText: "Full Name",
              controller: fullNameController,
            ),
            SizedBox(height: 24),
            AppWidgets.customTextField(
              hintText: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24),
            AppWidgets.customTextField(
              hintText: "Password",
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 36),
            AppWidgets.customTextField(
              hintText: "Re - Password",
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 36),
            AppWidgets.customButton(
              text: "Sign Up",
              onPressed: () {
                // handle sign-up logic
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
