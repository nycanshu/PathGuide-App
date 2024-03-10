import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/model/courseDataModel.dart';
import 'package:pathguide/tutor/controller/course_controller.dart';

class TutorCourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String tutor;
  final String duration;
  final String price;

  const TutorCourseCard({
    super.key,
    required this.title,
    required this.description,
    required this.tutor,
    required this.duration,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    TutorCourseController tutorCourseController =
        Get.put(TutorCourseController());
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {},
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Course: $title",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Text(
                  "Description: $description",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Teacher: $tutor",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // Add some spacing
                Text(
                  "Course Fee: $price",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Duration: $duration",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        tutorCourseController.deleteCourse(title);
                      },
                      child: const Text("Delete Course"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
