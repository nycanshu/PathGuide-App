import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pathguide/student/model/courseDataModel.dart';

class CoursesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<Course> courses = <Course>[].obs;
  final RxList<Course> filteredCourses = <Course>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  void fetchCourses() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('courses').get();
      courses.assignAll(
          querySnapshot.docs.map((doc) => Course.fromFirestore(doc)).toList());
      filteredCourses
          .assignAll(courses); // Initialize filteredCourses with all courses
    } catch (e) {
      print("Error fetching courses: $e");
    }
  }

  void filterCourses(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all courses
      filteredCourses.assignAll(courses);
    } else {
      // Otherwise, filter the courses based on the query
      filteredCourses.assignAll(courses.where((course) {
        // You can adjust filtering logic based on your requirements
        return course.title.toLowerCase().contains(query.toLowerCase()) ||
            course.description.toLowerCase().contains(query.toLowerCase()) ||
            course.tutor.toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }
}
