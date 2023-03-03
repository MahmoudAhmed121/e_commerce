
import 'package:e_commerce/ui/Home.dart';
import 'package:e_commerce/ui/login.dart';
import 'package:e_commerce/ui/register_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "Login": (context) => Login(),
        "regis": (context) => Regis(),
        "home":(context) => Home()
      
      },
    );
  }
}
