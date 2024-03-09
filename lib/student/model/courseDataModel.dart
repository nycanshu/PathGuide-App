import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String title;
  final String description;
  final String tutor;
  final String duration;
  final String price;

  Course({
    required this.title,
    required this.description,
    required this.tutor,
    required this.duration,
    required this.price,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      tutor: json['tutor'] ?? '',
      duration: json['duration'] ?? '',
      price: json['price'] ?? '',
    );
  }

  factory Course.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Course(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      tutor: data['tutor'] ?? '',
      duration: data['duration'] ?? '',
      price: data['price'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'tutor': tutor,
      'duration': duration,
      'price': price,
    };
  }
}
