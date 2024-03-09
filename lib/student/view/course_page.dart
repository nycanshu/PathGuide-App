import 'package:flutter/material.dart';
import 'package:pathguide/utils/app_colors.dart';

class CoursePage extends StatelessWidget {
  final String title;
  const CoursePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightblueshade,
        centerTitle: true,
        title: Text(title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Expanded(
          child: Center(
            child: Text("Course Page"),
          ),
        ),
      ),
    );
  }
}
