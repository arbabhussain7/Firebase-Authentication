import 'dart:async';

import 'package:firebase/views/authentication/signin_screen.dart';
import 'package:firebase/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenTimer();
  }

  void splashScreenTimer() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Timer(Duration(seconds: 2), () {
        Get.to(HomeScreen());
      });
    } else {
      Timer(Duration(seconds: 2), () {
        Get.to(SignInScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/images/splash-screen.png",
        width: 231.w,
        height: 186.h,
      ),
    ));
  }
}
