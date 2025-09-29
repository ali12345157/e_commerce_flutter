import 'package:e_commerce_flutter/verifyCodeScreen.dart';
import 'package:flutter/material.dart';
import 'Signin.dart';
import 'SignUp.dart';
import 'HomeScreen.dart';
import 'ForgetPasswordScreen.dart';
import 'newPasswordScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Signin.id,
      routes: {
        Signin.id: (context) => Signin(),
        Signup.id: (context) => Signup(),
        Homescreen.id: (context) => Homescreen(),
        ForgetPasswordScreen.id: (context) => const ForgetPasswordScreen(),
        VerifyCodeScreen.id: (context) => const VerifyCodeScreen(),
        NewPasswordScreen.id: (context) => const NewPasswordScreen(),
      },
    );
  }
}
