import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/utils/app_colors.dart';

import '../controller/tutor_authController.dart';
import 'bottomnavbarComponent/course_component.dart';
import 'bottomnavbarComponent/feedback_component.dart';
import 'bottomnavbarComponent/testComponent.dart';

class TutorHomePage extends StatefulWidget {
  const TutorHomePage({Key? key}) : super(key: key);

  @override
  _TutorHomePageState createState() => _TutorHomePageState();
}

class _TutorHomePageState extends State<TutorHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    CourseScreen(),
    TestScreen(),
    FeedbackScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TutorAuthController tutorAuthController = Get.put(TutorAuthController());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: AppColors.lightblueshade,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppColors.lightblueshade,
            icon: Icon(Icons.video_library),
            label: "Course",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: "Test",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: "Feedback",
          ),
        ],
      ),
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: AppColors.black,
          size: 30,
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightblueshade,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.black,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              tutorAuthController.logOut();
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.black,
              size: 30,
            ),
          ),
        ],
        title: const Text(
          "Tutor Dashboard",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
