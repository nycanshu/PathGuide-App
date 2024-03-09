import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/controller/courseController.dart';
// Import the CoursesController
// Import the Course model
import 'package:pathguide/student/helper/course_card.dart';

class HomeScreen extends StatelessWidget {
  CoursesController coursesController = Get.put(CoursesController());

  HomeScreen({super.key}); // Initialize CoursesController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 20),
                    Text("Search Anything"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Recently Played",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Example of a static CourseCard widget
            const CourseCard(
              image:
                  "https://firebasestorage.googleapis.com/v0/b/pathguide-7ae0f.appspot.com/o/path_guide.png?alt=media&token=c74d4c60-0bf2-46cd-8cbd-711bd31598bb",
              title: "Flutter",
              description: "Hello, this is the Flutter course",
              tutor: "Himanshu Kumar",
              duration: "2 hours",
              price: "300 rs",
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
                  onTap: () {},
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
                        image: course.image,
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
