import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/firebase_options.dart';
import 'package:pathguide/student/view/student_dashboard.dart';

import 'tutor/view/tutor_dashborad.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: TutorHomePage(),
    );
  }
}
