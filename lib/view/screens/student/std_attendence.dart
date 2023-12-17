import 'package:flutter/material.dart';

class StudentAttendancePage extends StatelessWidget {
  final List<Student> students = [
    Student(name: 'John', isPresent: true),
    Student(name: 'Alice', isPresent: false),
    Student(name: 'Bob', isPresent: true),
    // Add more students with their attendance status
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index].name),
            trailing: students[index].isPresent
                ? Icon(Icons.check, color: Colors.green)
                : Icon(Icons.close, color: Colors.red),
          );
        },
      ),
    );
  }
}

class Student {
  final String name;
  final bool isPresent;

  Student({required this.name, required this.isPresent});
}
