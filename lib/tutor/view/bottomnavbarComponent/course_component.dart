import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:pathguide/tutor/controller/course_controller.dart';

import 'package:pathguide/tutor/tutor_helper/tutor_course_card.dart';
import 'package:pathguide/tutor/view/add_course.dart';

import 'package:pathguide/utils/app_colors.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TutorCourseController tutorCourseController =
        Get.put(TutorCourseController());
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(const AddCourse());
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightsky,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Add Course Here",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "All Courses:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(() {
              if (tutorCourseController.courses.isEmpty) {
                // If courses are still being fetched, show a loading indicator
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // Once courses are fetched, display them in a ListView
                return ListView.builder(
                  itemCount: tutorCourseController.courses.length,
                  itemBuilder: (context, index) {
                    final course = tutorCourseController.courses[index];
                    return TutorCourseCard(
                      title: course.title,
                      description: course.description,
                      tutor: course.tutor,
                      duration: course.duration,
                      price: course.price,
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
