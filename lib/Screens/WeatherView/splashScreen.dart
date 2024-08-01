import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () async {
      Navigator.of(context).pushReplacementNamed('/');
    });
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xff152C3E),
        body: Center(child: LottieBuilder.asset('assets/Json/splash2.json')),
      ),
    );
  }
}
