import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Path Guide',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
