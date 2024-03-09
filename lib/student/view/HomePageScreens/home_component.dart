import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/controller/courseController.dart';
import 'package:pathguide/student/helper/course_card.dart';

import 'package:pathguide/student/view/HomePageScreens/allCourseComponent.dart';

class HomeScreen extends StatelessWidget {
  final CoursesController coursesController = Get.put(CoursesController());
  final TextEditingController searchController = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {
                coursesController.filterCourses(value);
              },
              decoration: InputDecoration(
                labelText: 'Search for a course',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text(
                  "All Courses",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(AllCourse());
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(() {
                if (coursesController.filteredCourses.isEmpty) {
                  return const Center(
                    child: Text("No courses found"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: coursesController.filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = coursesController.filteredCourses[index];
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}
