import 'package:attendee/view/model/notification_model.dart';
import 'package:attendee/view/model/student_model.dart';
import 'package:attendee/view/provider/home_provider.dart';
import 'package:attendee/view/screens/student/std_attendence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentSearch extends StatefulWidget {
  @override
  _StudentSearchState createState() => _StudentSearchState();
}

class _StudentSearchState extends State<StudentSearch> {
  // final List<Student> allStudents = [
  //   Student(id: '101', name: 'John', profile: 'Profile for John...'),
  //   Student(id: '102', name: 'Alice', profile: 'Profile for Alice...'),
  //   // Add more students
  // ];


  List<StudentListML> searchResults = [];

  void searchStudent(String query) {
    final homePro = Provider.of<HomeProvider>(context, listen: false);
    setState(() {
      searchResults = homePro.studentModel!.data.where((student) {
        return student.studentName
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            student.studentId.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (query) => searchStudent(query),
              decoration: InputDecoration(
                labelText: 'Search by name or ID',
                prefixIcon: Icon(Icons.search), // Add a search icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index].studentName),
                  subtitle:
                      Text("studentID : ${searchResults[index].studentId}"),
                  onTap: () {
                    // Navigate to the student's profile page or display it here
                    // For simplicity, we're displaying it on the same page
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(searchResults[index].studentName),
                          content: Text(
                              "studentID : ${searchResults[index].studentId}"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class Student {
//   final String id;
//   final String name;
//   final String profile;

//   Student({required this.id, required this.name, required this.profile});
// }
