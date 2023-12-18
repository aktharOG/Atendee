// ignore_for_file: library_private_types_in_public_api

import 'package:attendee/helpers/navigation_helper.dart';
import 'package:attendee/view/provider/home_provider.dart';
import 'package:attendee/view/screens/teacher/mark_attendance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherAttendancePage extends StatefulWidget {
  const TeacherAttendancePage({super.key});

  @override
  _TeacherAttendancePageState createState() => _TeacherAttendancePageState();
}

class _TeacherAttendancePageState extends State<TeacherAttendancePage> {
  // final List<Student> students = [
  //   Student(name: 'John', isPresent: true),
  //   Student(name: 'Alice', isPresent: true),
  //   Student(name: 'Bob', isPresent: true),
  //   // Add more students
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.onGetStudentsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: homePro.studentModel?.data.length,
        itemBuilder: (context, index) {
          final studentItem = homePro.studentModel?.data[index];
          return ListTile(
            onTap: () {
              push(
                  context,
                  MarkAttendenceScreen(
                    studentModel: studentItem!,
                  ));
            },
            title: Text(studentItem?.studentName ?? 'no name'),
            trailing: InkWell(
              onTap: () {
                setState(() {
                  //      students[index].isPresent = !students[index].isPresent;
                });
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: students[index].isPresent ? Colors.green : Colors.red,
                ),
                // child: students[index].isPresent
                //     ? Icon(
                //         Icons.check,
                //         color: Colors.white,
                //         size: 16,
                //       )
                //     : Icon(
                //         Icons.close,
                //         color: Colors.white,
                //         size: 16,
                //       ),
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
