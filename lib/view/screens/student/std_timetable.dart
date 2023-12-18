import 'package:attendee/view/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentTimetablePage extends StatefulWidget {
  const StudentTimetablePage({super.key});

  @override
  State<StudentTimetablePage> createState() => _StudentTimetablePageState();
}

class _StudentTimetablePageState extends State<StudentTimetablePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);

      homePro.onFetchTimeTable();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return RefreshIndicator(
      onRefresh: () async {
        homePro.onFetchTimeTable();
      },
      child: const Scaffold(
        // appBar: AppBar(
        //   title: Text('Class Timetable'),
        // ),
        body: Timetable(),
      ),
    );
  }
}

class Timetable extends StatelessWidget {
  const Timetable({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);
    return homePro.isTimeTableLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: const [
                  DataColumn(label: Text('Day')),
                  DataColumn(label: Text('Period 1')),
                  DataColumn(label: Text('Period 2')),
                  DataColumn(label: Text('Period 3')),
                  DataColumn(label: Text('Period 4')),
                  DataColumn(label: Text('Period 5')),
                  DataColumn(label: Text('Period 6')),
                  DataColumn(label: Text('Period 7')),
                ],
                rows: homePro.timeTableModel!.data
                    .map((e) => DataRow(cells: [
                          DataCell(Text(e.day)),
                          DataCell(Text(e.h1)),
                          DataCell(Text(e.h2)),
                          DataCell(Text(e.h3)),
                          DataCell(Text(e.h4)),
                          DataCell(Text(e.h5)),
                          DataCell(Text(e.h6)),
                          DataCell(Text(e.h1)),
                        ]))
                    .toList()),
          );
  }
}
