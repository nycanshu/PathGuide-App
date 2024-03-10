import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/controller/courseController.dart';
import 'package:pathguide/student/controller/helper_controller.dart';
import 'package:pathguide/student/model/courseDataModel.dart';
import 'package:pathguide/student/view/course_page.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String tutor;
  final String duration;
  final String price;

  const CourseCard({
    super.key,
    required this.title,
    required this.description,
    required this.tutor,
    required this.duration,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    HelperController helperController = Get.put(HelperController());
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Get.to(CoursePage(title: title));
        },
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 159, 191, 217),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        helperController.buyedcourses.add(
                          Course(
                            title: title,
                            description: description,
                            tutor: tutor,
                            duration: duration,
                            price: price,
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
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
