import 'package:e_commerce_flutter/Splash-Screen.dart';
import 'package:flutter/material.dart';

void main(){


  runApp((MyApp()));



}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: {SplashScreen.id: (context)=>SplashScreen(),},
      initialRoute:SplashScreen.id
    );
  }




}