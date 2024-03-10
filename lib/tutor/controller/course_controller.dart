import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pathguide/student/model/courseDataModel.dart';

class TutorCourseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final coursetitle = TextEditingController();
  final coursedesc = TextEditingController();
  final tutorname = TextEditingController();
  final duration = TextEditingController();
  final price = TextEditingController();

  final RxList<Course> courses = <Course>[].obs;

  void clearControllers() {
    coursetitle.clear();
    coursedesc.clear();
    tutorname.clear();
    duration.clear();
    price.clear();
  }

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  Future<void> addCourseToFirestore(Course course) async {
    try {
      await _firestore.collection('courses').add(course.toJson());

      courses.add(course);
      clearControllers();
      Get.snackbar('Success', 'Course added successfully');
    } catch (e) {
      print('Error adding course: $e');
      Get.snackbar('Error', 'Failed to add course');
    }
  }

  void fetchCourses() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('courses').get();
      courses.assignAll(
          querySnapshot.docs.map((doc) => Course.fromFirestore(doc)).toList());
    } catch (e) {
      print("Error fetching😒😒😒😒😒 courses: $e");
    }
  }

  Future<void> deleteCourse(String title) async {
    try {
      // Find the course with the provided title
      Course courseToDelete = courses.firstWhere(
        (course) => course.title == title,
        orElse: () => throw 'Course not found',
      );

      // Delete the course document from Firestore
      await _firestore.collection('courses').doc(title).delete();

      // Remove the course from the list
      courses.remove(courseToDelete);
      fetchCourses();
      Get.snackbar('Success', 'Course deleted successfully');
      print('Course deleted successfully');
    } catch (e) {
      print('Error deleting course: $e');
    }
  }
}
