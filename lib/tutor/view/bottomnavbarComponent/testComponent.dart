import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/calling_feature/group_calling_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy list of ongoing tests (replace it with actual data)
    List<String> ongoingTests = [
      "Hindi Language Test",
      "English Test 1",
      "Grammar Test 2",
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ongoing Tests",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: ongoingTests.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2, // Add elevation for a raised effect
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        ongoingTests[index],
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        // Handle tapping on the ongoing test
                        // You can navigate to the details of the test or take any action here
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(GroupCallScreen());
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.video_call), // Set FAB background color
      ),
    );
  }
}
