import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/model/courseDataModel.dart';

import 'package:pathguide/utils/app_colors.dart';

import '../controller/course_controller.dart';

class AddCourse extends StatelessWidget {
  const AddCourse({super.key});

  @override
  Widget build(BuildContext context) {
    TutorCourseController tutorCourseController =
        Get.put(TutorCourseController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.lightblueshade,
        title: const Text(
          'Add a new Course',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter Course Details:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: tutorCourseController.coursetitle,
                decoration: const InputDecoration(
                  labelText: 'Course Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: tutorCourseController.coursedesc,
                decoration: const InputDecoration(
                  labelText: 'Course Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: tutorCourseController.tutorname,
                decoration: const InputDecoration(
                  labelText: 'Course Tutor',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: tutorCourseController.duration,
                decoration: const InputDecoration(
                  labelText: 'Course Duration',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: tutorCourseController.price,
                decoration: const InputDecoration(
                  labelText: 'Course Price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  tutorCourseController.addCourseToFirestore(
                    Course(
                      title: tutorCourseController.coursetitle.text,
                      description: tutorCourseController.coursedesc.text,
                      tutor: tutorCourseController.tutorname.text,
                      duration: tutorCourseController.duration.text,
                      price: tutorCourseController.price.text,
                    ),
                  );
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
                      "Add Course",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
