import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:pathguide/student/model/courseDataModel.dart';

class TutorCourseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<Course> courses = <Course>[].obs;

  Future<void> addCourseToFirestore(Course course) async {
    try {
      await _firestore.collection('courses').add(course.toJson());

      courses.add(course);

      Get.snackbar('Success', 'Course added successfully');
    } catch (e) {
      print('Error adding course: $e');
      Get.snackbar('Error', 'Failed to add course');
    }
  }
}
