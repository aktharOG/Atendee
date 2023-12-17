import 'package:flutter/material.dart';

class StudentTimetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Class Timetable'),
      // ),
      body: Timetable(),
    );
  }
}

class Timetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:Axis.horizontal ,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Day')),
          DataColumn(label: Text('Period 1')),
          DataColumn(label: Text('Period 2')),
          DataColumn(label: Text('Period 3')),
          DataColumn(label: Text('Period 4')),
          DataColumn(label: Text('Period 5')),
          DataColumn(label: Text('Period 6')),
          DataColumn(label: Text('Period 7')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Monday')),
            DataCell(Text('Class A')),
            DataCell(Text('Class B')),
            DataCell(Text('Class C')),
            DataCell(Text('Class D')),
            DataCell(Text('Class E')),
            DataCell(Text('Class F')),
            DataCell(Text('Class G')),
          ]),
          DataRow(cells: [
            DataCell(Text('Tuesday')),
            DataCell(Text('Class H')),
            DataCell(Text('Class I')),
            DataCell(Text('Class J')),
            DataCell(Text('Class K')),
            DataCell(Text('Class L')),
            DataCell(Text('Class M')),
            DataCell(Text('Class N')),
          ]),
          DataRow(cells: [
            DataCell(Text('Wednesday')),
            DataCell(Text('Class O')),
            DataCell(Text('Class P')),
            DataCell(Text('Class Q')),
            DataCell(Text('Class R')),
            DataCell(Text('Class S')),
            DataCell(Text('Class T')),
            DataCell(Text('Class U')),
          ]),
          DataRow(cells: [
            DataCell(Text('Thursday')),
            DataCell(Text('Class V')),
            DataCell(Text('Class W')),
            DataCell(Text('Class X')),
            DataCell(Text('Class Y')),
            DataCell(Text('Class Z')),
            DataCell(Text('Class AA')),
            DataCell(Text('Class AB')),
          ]),
          DataRow(cells: [
            DataCell(Text('Friday')),
            DataCell(Text('Class AC')),
            DataCell(Text('Class AD')),
            DataCell(Text('Class AE')),
            DataCell(Text('Class AF')),
            DataCell(Text('Class AG')),
            DataCell(Text('Class AH')),
            DataCell(Text('Class AI')),
          ]),
        ],
      ),
    );
  }
}
