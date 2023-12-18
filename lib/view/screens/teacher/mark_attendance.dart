import 'package:attendee/view/model/student_model.dart';
import 'package:attendee/view/provider/home_provider.dart';
import 'package:attendee/view/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MarkAttendenceScreen extends StatefulWidget {
  final Datum studentModel;
  const MarkAttendenceScreen({super.key, required this.studentModel});

  @override
  State<MarkAttendenceScreen> createState() => _MarkAttendenceScreenState();
}

class _MarkAttendenceScreenState extends State<MarkAttendenceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.onGetAttendenceList(widget.studentModel.studentId,
          DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
          elevation: 20,
          title: const Text(
            'Mark Attendance',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: const Color.fromRGBO(233, 240, 255, 1),
          iconTheme: const IconThemeData(color: Colors.black)),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadingText(
                  text: widget.studentModel.studentName,
                  fontSize: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () async {
                      await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              onDatePickerModeChange: (value) {})
                          .then((value) {
                        if (value != null) {
                          homePro.onGetAttendenceList(
                              widget.studentModel.studentId,
                              DateFormat('yyyy-MM-dd')
                                  .format(value)
                                  .toString());
                        }
                      });
                    },
                    child: const Icon(Icons.calendar_month))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if(homePro.attendanceModel!.data.isNotEmpty)
            HeadingText(
                text: DateFormat('yyyy-MM-dd')
                    .format(homePro.attendanceModel!.data[0].date)
                    .toString()
                    .toString(),fontSize: 16,),
            const SizedBox(
              height: 30,
            ),
            HourItem(
            
              hour: "h1",
              classID: widget.studentModel.clasId,
              studentID: widget.studentModel.studentId,
              isChecked:homePro.attendanceModel!.data.isEmpty?true: homePro.attendanceModel?.data[0].h1??true,
            ),
            HourItem(
              hour: "h2",
              classID: widget.studentModel.clasId,
              studentID: widget.studentModel.studentId,
                isChecked:homePro.attendanceModel!.data.isEmpty?true: homePro.attendanceModel?.data[0].h2??true,
            ),
            HourItem(
              hour: "h3",
              classID: widget.studentModel.clasId,
              studentID: widget.studentModel.studentId,
                isChecked:homePro.attendanceModel!.data.isEmpty?true: homePro.attendanceModel?.data[0].h3??true,
            ),
            HourItem(
              hour: "h4",
              classID: widget.studentModel.clasId,
              studentID: widget.studentModel.studentId,
                isChecked:homePro.attendanceModel!.data.isEmpty?true: homePro.attendanceModel?.data[0].h4??true,
            ),
            HourItem(
              hour: "h5",
              classID: widget.studentModel.clasId,
              studentID: widget.studentModel.studentId,
                isChecked:homePro.attendanceModel!.data.isEmpty?true: homePro.attendanceModel?.data[0].h5??true,
            ),
            HourItem(
              hour: "h6",
              classID: widget.studentModel.clasId,
              studentID: widget.studentModel.studentId,
                isChecked:homePro.attendanceModel!.data.isEmpty?true: homePro.attendanceModel?.data[0].h6??true,
            ),
          ],
        ),
      ),
    );
  }
}

class HourItem extends StatefulWidget {
  final String hour;
  bool isChecked;
  final String studentID;
  final String classID;
  HourItem(
      {super.key,
      required this.hour,
      required this.studentID,
      required this.classID,this.isChecked=true});

  @override
  State<HourItem> createState() => _HourItemState();
}

class _HourItemState extends State<HourItem> {
  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return ListTile(
      onTap: () {
        homePro.onMarkAttendence(
          context,
          classID: widget.classID,
          teacherID: homePro.profileModelTCR!.data.teacherId,
          studentID: widget.studentID,
          hour: "h6",
          date: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
        );
        setState(() {
          widget.isChecked = !widget.isChecked;
        });
      },
      title: Text(widget.hour),
      trailing: InkWell(
        onTap: () {
          setState(() {
            homePro.onMarkAttendence(
              context,
              classID: widget.classID,
              teacherID: homePro.profileModelTCR!.data.teacherId,
              studentID: widget.studentID,
              hour: "h6",
              date: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
            );

            widget.isChecked = !widget.isChecked;
          });
        },
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isChecked ? Colors.green : Colors.red,
          ),
          child: widget.isChecked
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                )
              : const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
        ),
      ),
    );
  }
}
