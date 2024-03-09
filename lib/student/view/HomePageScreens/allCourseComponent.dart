import 'package:flutter/material.dart';
import 'package:pathguide/utils/app_colors.dart';

class AllCourse extends StatelessWidget {
  const AllCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(
        child: Text("All course page"),
      ),
    );
  }
}
