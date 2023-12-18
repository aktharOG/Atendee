// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

AttendanceModel attendanceModelFromJson(String str) => AttendanceModel.fromJson(json.decode(str));

String attendanceModelToJson(AttendanceModel data) => json.encode(data.toJson());

class AttendanceModel {
    String message;
    List<Datum> data;

    AttendanceModel({
        required this.message,
        required this.data,
    });

    factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String classIdId;
    DateTime date;
    String teacherId;
    String studentId;
    bool h1;
    bool h2;
    bool h3;
    bool h4;
    bool h5;
    bool h6;

    Datum({
        required this.id,
        required this.classIdId,
        required this.date,
        required this.teacherId,
        required this.studentId,
        required this.h1,
        required this.h2,
        required this.h3,
        required this.h4,
        required this.h5,
        required this.h6,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        classIdId: json["class_id_id"],
        date: DateTime.parse(json["date"]),
        teacherId: json["teacher_id"],
        studentId: json["student_id"],
        h1: json["h1"],
        h2: json["h2"],
        h3: json["h3"],
        h4: json["h4"],
        h5: json["h5"],
        h6: json["h6"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_id_id": classIdId,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "teacher_id": teacherId,
        "student_id": studentId,
        "h1": h1,
        "h2": h2,
        "h3": h3,
        "h4": h4,
        "h5": h5,
        "h6": h6,
    };
}
