import 'package:e_commerce/explore.dart';
import 'package:e_commerce/ui/Home.dart';
import 'package:e_commerce/ui/account.dart';
import 'package:e_commerce/ui/cart.dart';
import 'package:e_commerce/ui/offer.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lottie/lottie.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  bool interNet = false;
  int currentIndex = 0;
  List listOfScreens = [
    Home(),
    Explore(),
    Cart(),
    Offer(),
    Account(),
  ];

  @override
  void initState() {
    super.initState();
    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          interNet = false;
        });
      } else {
        setState(() {
          interNet = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (interNet == false) {
      return Scaffold(
        body: Center(
          child: Lottie.asset("animations/internet.json"),
        ),
      );
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              print(index);
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer_rounded), label: "Offer"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Account"),
          ]),
      body: listOfScreens[currentIndex],
    );
  }
}
