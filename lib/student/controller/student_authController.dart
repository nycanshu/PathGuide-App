import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/view/student_dashboard.dart';

class StudentAuthController extends GetxController {
  final studentemail = TextEditingController();
  final studentpass = TextEditingController();
  final studentname = TextEditingController();

  final auth = FirebaseAuth.instance;

  //signup code
  void signupUser() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: studentemail.text, password: studentpass.text);
      Get.snackbar(
        'Success',
        'Account Created Successfully',
      );

      print("Signed up✔️✔️✔️✔️");
      // Get.offAll(const Signin());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'Email id already in use!',
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Error',
          'Please Enter valid Email!',
        );
      }
    } catch (e) {
      //print('Unexpected error: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again later.',
      );
    }
  }

  //login code
  void loginUser() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: studentemail.text, password: studentpass.text);

      Get.snackbar(
        'Success',
        'Login Sucessfully',
      );
      studentemail.clear();
      studentpass.clear();
      Get.offAll(const StudentHomePage());
      print("Logged in✔️✔️✔️✔️ ");
      // Get.offAll(const HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Error',
          'Please Enter valid Email!',
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      //print('Unexpected error: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again later.',
      );
    }
  }

  //log out code
  void logOut() async {
    await auth.signOut();
    //
    print('Logged out🙄🙄');
  }
}
