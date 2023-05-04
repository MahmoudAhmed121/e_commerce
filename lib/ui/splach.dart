import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), navigationBar);
  }

  navigationBar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = await prefs.getString("access_token");

    if (data == null) {
      Navigator.pushReplacementNamed(context, "regis");
    } else {
      Navigator.pushReplacementNamed(context, "bottomBar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff40BFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "images/iconSingle.png",
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
