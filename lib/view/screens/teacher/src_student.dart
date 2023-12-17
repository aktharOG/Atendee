import 'package:flutter/material.dart';

class StudentSearch extends StatefulWidget {
  @override
  _StudentSearchState createState() => _StudentSearchState();
}

class _StudentSearchState extends State<StudentSearch> {
  final List<Student> allStudents = [
    Student(id: '101', name: 'John', profile: 'Profile for John...'),
    Student(id: '102', name: 'Alice', profile: 'Profile for Alice...'),
    // Add more students
  ];

  List<Student> searchResults = [];

  void searchStudent(String query) {
    setState(() {
      searchResults = allStudents.where((student) {
        return student.name.toLowerCase().contains(query.toLowerCase()) ||
            student.id.toLowerCase().contains(query.toLowerCase());
      }).toList();
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
                  title: Text(searchResults[index].name),
                  subtitle: Text(searchResults[index].id),
                  onTap: () {
                    // Navigate to the student's profile page or display it here
                    // For simplicity, we're displaying it on the same page
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(searchResults[index].name),
                          content: Text(searchResults[index].profile),
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

class Student {
  final String id;
  final String name;
  final String profile;

  Student({required this.id, required this.name, required this.profile});
}
