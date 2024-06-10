// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/SplashScreen/phone_number_screen.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:flutter_customer_app/Utils/constants.dart';
import 'package:flutter_customer_app/dash_board_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(const Duration(seconds: 1), () async {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString('tokenId');
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var token = prefs.getString('tokenId');

      if (token == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const PhoneNumberScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: whiteColor,
      height: height,
      width: width,
      child: Image.asset(
        Images.splashScreenImg,
        fit: BoxFit.fill,
      ),
    );
    // AnimatedSplashScreen(
    //     duration: 3000,
    //     splash: SizedBox(
    //       height: height,
    //       width: width,
    //       child: Image.asset(
    //         Images.splashScreenImg,
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //     nextScreen: const DashboardScreen(),
    //     splashTransition:
    //         SplashTransition.fadeTransition,
    //     // pageTransitionType:
    //     //     PageTransitionType.scale,
    //     backgroundColor: Colors.blue);
  }
}
