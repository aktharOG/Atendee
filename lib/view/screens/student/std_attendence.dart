import 'package:attendee/view/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentAttendancePage extends StatefulWidget {
  @override
  State<StudentAttendancePage> createState() => _StudentAttendancePageState();
}

class _StudentAttendancePageState extends State<StudentAttendancePage> {
  final List<Student> students = [
    Student(name: 'John', isPresent: true),
    Student(name: 'Alice', isPresent: false),
    Student(name: 'Bob', isPresent: true),
    // Add more students with their attendance status
  ];

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
            title: Text(studentItem?.studentName ?? 'no name'),
            trailing: students[index].isPresent
                ? const Icon(Icons.check, color: Colors.green)
                : const Icon(Icons.close, color: Colors.red),
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
