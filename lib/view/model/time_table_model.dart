// To parse this JSON data, do
//
//     final timeTableModel = timeTableModelFromJson(jsonString);

import 'dart:convert';

TimeTableModel timeTableModelFromJson(String str) => TimeTableModel.fromJson(json.decode(str));

String timeTableModelToJson(TimeTableModel data) => json.encode(data.toJson());

class TimeTableModel {
    String message;
    List<Datum> data;

    TimeTableModel({
        required this.message,
        required this.data,
    });

    factory TimeTableModel.fromJson(Map<String, dynamic> json) => TimeTableModel(
        message: json["Message"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String classIdId;
    String day;
    String h1;
    String h2;
    String h3;
    String h4;
    String h5;
    String h6;

    Datum({
        required this.id,
        required this.classIdId,
        required this.day,
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
        day: json["day"],
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
        "day": day,
        "h1": h1,
        "h2": h2,
        "h3": h3,
        "h4": h4,
        "h5": h5,
        "h6": h6,
    };
}
