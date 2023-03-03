import 'package:flutter/material.dart';

class Regis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("back")
            )
          ]),
        ),
      ),
    );
  }
}
