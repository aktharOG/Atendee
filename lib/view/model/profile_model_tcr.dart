// To parse this JSON data, do
//
//     final profileModelTcr = profileModelTcrFromJson(jsonString);

import 'dart:convert';

ProfileModelTcr profileModelTcrFromJson(String str) => ProfileModelTcr.fromJson(json.decode(str));

String profileModelTcrToJson(ProfileModelTcr data) => json.encode(data.toJson());

class ProfileModelTcr {
    String message;
    Data data;

    ProfileModelTcr({
        required this.message,
        required this.data,
    });

    factory ProfileModelTcr.fromJson(Map<String, dynamic> json) => ProfileModelTcr(
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data.toJson(),
    };
}

class Data {
    String teacherId;
    String userIdId;
    String teacherName;
    String teacherAddress;
    String phone;
    String gender;
    String email;
    String classInchargeId;
    String image;

    Data({
        required this.teacherId,
        required this.userIdId,
        required this.teacherName,
        required this.teacherAddress,
        required this.phone,
        required this.gender,
        required this.email,
        required this.classInchargeId,
        required this.image,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        teacherId: json["teacher_id"],
        userIdId: json["user_id_id"],
        teacherName: json["teacher_name"],
        teacherAddress: json["teacher_address"],
        phone: json["phone"],
        gender: json["gender"],
        email: json["email"],
        classInchargeId: json["class_incharge_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "teacher_id": teacherId,
        "user_id_id": userIdId,
        "teacher_name": teacherName,
        "teacher_address": teacherAddress,
        "phone": phone,
        "gender": gender,
        "email": email,
        "class_incharge_id": classInchargeId,
        "image": image,
    };
}
