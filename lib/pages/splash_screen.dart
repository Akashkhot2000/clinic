import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:clinic/pages/Profile.dart';
import 'package:clinic/pages/Rotational_details.dart';
import 'package:clinic/pages/Rotational_page.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlutterSplashScreen.scale(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.green,
            Colors.green,
          ],
        ),
        childWidget: SizedBox(
          height: 400,
          child: Image.asset("assets/icons/splash.png"),
        ),
        duration: const Duration(milliseconds: 2500),
        animationDuration: const Duration(milliseconds: 2000),
        onAnimationEnd: () => debugPrint("On Scale End"),
        nextScreen: const Rotational_page(),
      )),
    );
  }
}
