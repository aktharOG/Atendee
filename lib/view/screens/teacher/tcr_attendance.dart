import 'package:flutter/material.dart';

void main() {
  runApp(TeacherAttendanceApp());
}

class TeacherAttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TeacherAttendancePage(),
    );
  }
}

class TeacherAttendancePage extends StatefulWidget {
  @override
  _TeacherAttendancePageState createState() => _TeacherAttendancePageState();
}

class _TeacherAttendancePageState extends State<TeacherAttendancePage> {
  final List<Student> students = [
    Student(name: 'John', isPresent: true),
    Student(name: 'Alice', isPresent: true),
    Student(name: 'Bob', isPresent: true),
    // Add more students
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index].name),
            trailing: InkWell(
              onTap: () {
                setState(() {
                  students[index].isPresent = !students[index].isPresent;
                });
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: students[index].isPresent ? Colors.green : Colors.red,
                ),
                child: students[index].isPresent
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 16,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Student {
  String name;
  bool isPresent;

  Student({required this.name, required this.isPresent});
}
