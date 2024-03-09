import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/controller/courseController.dart';
import 'package:pathguide/student/helper/course_card.dart';

class AllCourse extends StatelessWidget {
  const AllCourse({super.key});

  @override
  Widget build(BuildContext context) {
    CoursesController coursesController = Get.put(CoursesController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Expanded(
          child: Obx(
            () {
              if (coursesController.courses.isEmpty) {
                // If courses are still being fetched, show a loading indicator
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // Once courses are fetched, display them in a ListView
                return ListView.builder(
                  itemCount: coursesController.courses.length,
                  itemBuilder: (context, index) {
                    final course = coursesController.courses[index];
                    return CourseCard(
                      title: course.title,
                      description: course.description,
                      tutor: course.tutor,
                      duration: course.duration,
                      price: course.price,
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
