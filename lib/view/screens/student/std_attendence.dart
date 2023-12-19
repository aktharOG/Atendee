import 'package:attendee/view/provider/home_provider.dart';
import 'package:attendee/view/screens/teacher/mark_attendance.dart';
import 'package:attendee/view/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

      homePro.onGetAttendenceList(homePro.profileModelSTD?.data.studentId,
          DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return Scaffold(
        body: Column(
      children: [
        ListTile(
          title: Text(
            homePro.profileModelSTD?.data.studentName ?? 'no name',
            style: const TextStyle(fontSize: 20),
          ),
          trailing: InkWell(
            onTap: () async {
              await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                      onDatePickerModeChange: (value) {})
                  .then((value) {
                if (value != null) {
                  homePro.onGetAttendenceList(
                      homePro.profileModelSTD?.data.studentId,
                      DateFormat('yyyy-MM-dd').format(value).toString());
                }
              });
            },
            child: const Icon(Icons.calendar_month),
          ),
          // trailing: students[index].isPresent
          //     ? const Icon(Icons.check, color: Colors.green)
          //     : const Icon(Icons.close, color: Colors.red),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(),
        if (homePro.attendanceModel!.data.isNotEmpty)
          HeadingText(
            text: DateFormat('yyyy-MM-dd')
                .format(homePro.attendanceModel!.data[0].date)
                .toString()
                .toString(),
            fontSize: 16,
          ),
        const SizedBox(
          height: 30,
        ),
        HourItem(
          isEditable: false,
          hour: "h1",
          classID: homePro.profileModelSTD?.data.clasId ?? '',
          studentID: homePro.profileModelSTD?.data.studentId ?? "",
          isChecked: homePro.attendanceModel!.data.isEmpty
              ? true
              : homePro.attendanceModel?.data[0].h1 ?? true,
        ),
        HourItem(
          isEditable: false,
          hour: "h2",
          classID: homePro.profileModelSTD?.data.clasId ?? '',
          studentID: homePro.profileModelSTD?.data.studentId ?? "",
          isChecked: homePro.attendanceModel!.data.isEmpty
              ? true
              : homePro.attendanceModel?.data[0].h2 ?? true,
        ),
        HourItem(
          isEditable: false,
          hour: "h3",
          classID: homePro.profileModelSTD?.data.clasId ?? '',
          studentID: homePro.profileModelSTD?.data.studentId ?? "",
          isChecked: homePro.attendanceModel!.data.isEmpty
              ? true
              : homePro.attendanceModel?.data[0].h3 ?? true,
        ),
        HourItem(
          isEditable: false,
          hour: "h4",
          classID: homePro.profileModelSTD?.data.clasId ?? '',
          studentID: homePro.profileModelSTD?.data.studentId ?? "",
          isChecked: homePro.attendanceModel!.data.isEmpty
              ? true
              : homePro.attendanceModel?.data[0].h4 ?? true,
        ),
        HourItem(
          isEditable: false,
          hour: "h5",
          classID: homePro.profileModelSTD?.data.clasId ?? '',
          studentID: homePro.profileModelSTD?.data.studentId ?? "",
          isChecked: homePro.attendanceModel!.data.isEmpty
              ? true
              : homePro.attendanceModel?.data[0].h5 ?? true,
        ),
        HourItem(
          isEditable: false,
          hour: "h6",
          classID: homePro.profileModelSTD?.data.clasId ?? '',
          studentID: homePro.profileModelSTD?.data.studentId ?? "",
          isChecked: homePro.attendanceModel!.data.isEmpty
              ? true
              : homePro.attendanceModel?.data[0].h6 ?? true,
        ),
      ],
    ));
    //   },
    //  ),
    //  );
  }
}

class Student {
  final String name;
  final bool isPresent;

  Student({required this.name, required this.isPresent});
}
