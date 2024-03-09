import 'package:flutter/material.dart';
import 'package:pathguide/student/view/HomePageScreens/allCourseComponent.dart';
import 'package:pathguide/student/view/HomePageScreens/home_component.dart';
import 'package:pathguide/student/view/HomePageScreens/learningComponet.dart';
import 'package:pathguide/utils/app_colors.dart';

import 'HomePageScreens/profileComponent.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    MyLearningScreen(),
    AllCourse(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: AppColors.lightblueshade,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppColors.lightblueshade,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "My learning",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: "All Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: AppColors.black,
            size: 30,
          ),
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
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: AppColors.black,
              size: 30,
            ),
          ),
        ],
        title: const Text(
          "Student Dashboard",
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
