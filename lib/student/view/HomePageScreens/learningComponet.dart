// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/controller/helper_controller.dart';
import 'package:pathguide/student/helper/course_card.dart';

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelperController helperController = Get.put(HelperController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text(
              "My Courses :",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: helperController.buyedcourses.length,
                itemBuilder: (context, index) {
                  final course = helperController.buyedcourses[index];
                  return CourseCard(
                    title: course.title,
                    description: course.description,
                    tutor: course.tutor,
                    duration: course.duration,
                    price: course.price,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
