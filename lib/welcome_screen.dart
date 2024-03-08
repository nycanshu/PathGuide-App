import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/view/student_signup.dart';
import 'package:pathguide/utils/app_colors.dart';
import 'package:pathguide/utils/custom_button.dart';

import 'tutor/view/tutor_signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.whiteshade,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 40,
            right: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                height: 250,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/path_guide.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Path Guide",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue),
              ),
              const Text(
                "Your personal tutor",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Choose Your Role to Continue",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthButton(
                  onTap: () {
                    Get.to(const StudentSignUp());
                  },
                  text: "Student"),
              const SizedBox(
                height: 20,
              ),
              AuthButton(
                  onTap: () {
                    Get.to(const TutorSignup());
                  },
                  text: "Tutor"),
            ],
          ),
        ),
      ),
    );
  }
}
