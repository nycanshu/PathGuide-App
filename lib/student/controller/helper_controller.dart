import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pathguide/student/model/courseDataModel.dart';

class HelperController extends GetxController {
  List<Map<String, dynamic>> courseData = [
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/pathguide-7ae0f.appspot.com/o/path_guide.png?alt=media&token=c74d4c60-0bf2-46cd-8cbd-711bd31598bb",
      "title": "John Doe",
      "description": "Learn English",
      "tutor": "John Doe",
      "duration": "2 hours",
      "price": "20",
    },
  ];

  RxList<Course> buyedcourses = [
    Course(
      title: "Learn English",
      description: "Learn English",
      tutor: "John Doe",
      duration: "2 hours",
      price: "20",
    ),
  ].obs;
}
