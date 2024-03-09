import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pathguide/student/model/courseDataModel.dart';
// Import your Course model

class CoursesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<Course> courses = <Course>[].obs;

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
    } catch (e) {
      print("Error fetching😒😒😒😒😒 courses: $e");
    }
  }
}
