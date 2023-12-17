// To parse this JSON data, do
//
//     final profileModelStd = profileModelStdFromJson(jsonString);

import 'dart:convert';

ProfileModelStd profileModelStdFromJson(String str) => ProfileModelStd.fromJson(json.decode(str));

String profileModelStdToJson(ProfileModelStd data) => json.encode(data.toJson());

class ProfileModelStd {
    String message;
    Data data;

    ProfileModelStd({
        required this.message,
        required this.data,
    });

    factory ProfileModelStd.fromJson(Map<String, dynamic> json) => ProfileModelStd(
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data.toJson(),
    };
}

class Data {
    String studentId;
    String userIdId;
    String studentName;
    String studentAddress;
    String phone;
    String gender;
    String email;
    String clasId;
    String image;

    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
