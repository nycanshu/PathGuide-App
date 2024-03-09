import 'package:flutter/material.dart';
import 'package:pathguide/utils/app_colors.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

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
