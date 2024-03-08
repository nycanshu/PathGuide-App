import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Path Guide'),
      ),
      body: const Center(
        child: Text('Welcome to Path Guide'),
      ),
    ));
  }
}
