import 'package:clinic/pages/Rotational_details.dart';
import 'package:clinic/pages/Rotational_page.dart';
import 'package:clinic/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/splash_screen",
        routes: {
          "/": (context) => Rotational_page(),
          "/Home": (context) => Rotational_details(),
          "/splash_screen": (context) => splash_screen()
        },
      );
    });
  }
}
