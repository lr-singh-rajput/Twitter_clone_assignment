import 'package:assessment_twitter/pages/SignupPage.dart';
import 'package:flutter/material.dart';

import 'Widget.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("sign In"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [


              SizedBox(height: 50,),

              AppWidgets.customTextField(
                hintText: "Email or username",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24),
              AppWidgets.customTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 36),
              AppWidgets.customButton(
                text: "Log in",
                onPressed: () {
                  print("login succesfull ");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>signupPage()));
                  // login logic here
                },
              ),



              SizedBox(height: 40,),
              Text("Forget password",style: TextStyle(
                color: Colors.lightBlue,   fontSize: 16,
              ),)
            ],
          ),
        ),
      ) ,
    );
  }
}
