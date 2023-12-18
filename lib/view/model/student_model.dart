// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
    String message;
    List<Datum> data;

    StudentModel({
        required this.message,
        required this.data,
    });

    factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        message: json["Message"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String studentId;
    String userIdId;
    String studentName;
    String studentAddress;
    String phone;
    String gender;
    String email;
    String clasId;
    String image;

    Datum({
        required this.studentId,
        required this.userIdId,
        required this.studentName,
        required this.studentAddress,
        required this.phone,
        required this.gender,
        required this.email,
        required this.clasId,
        required this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        studentId: json["student_id"],
        userIdId: json["user_id_id"],
        studentName: json["student_name"],
        studentAddress: json["student_address"],
        phone: json["phone"],
        gender: json["gender"],
        email: json["email"],
        clasId: json["clas_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "user_id_id": userIdId,
        "student_name": studentName,
        "student_address": studentAddress,
        "phone": phone,
        "gender": gender,
        "email": email,
        "clas_id": clasId,
        "image": image,
    };
}
