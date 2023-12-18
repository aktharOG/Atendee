import 'dart:convert';

import 'package:attendee/helpers/navigation_helper.dart';
import 'package:attendee/services/dio_service.dart';
import 'package:attendee/view/model/attendance_model.dart';
import 'package:attendee/view/model/notification_model.dart';
import 'package:attendee/view/model/profile_model_std.dart';
import 'package:attendee/view/model/profile_model_tcr.dart';
import 'package:attendee/view/model/student_model.dart';
import 'package:attendee/view/model/time_table_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  NotificationModel? notificationModelST; //student
  NotificationModel? notificationModelTR; //teacher

  ProfileModelStd? profileModelSTD; // profile data std
  ProfileModelTcr? profileModelTCR; // profile data tcr

  TimeTableModel? timeTableModel; // time table

  StudentModel? studentModel; // student

  AttendanceModel? attendanceModel; //attendenceModel

  // table
  // List<DataColumn> columns = [];
  List<DataRow> rows = [];

  bool isNotificationLoading = false;
  bool isTimeTableLoading = false;

  // get student notification

  getNotificationStudents() async {
    isNotificationLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.post, url: "getnotificationforstudents");

    if (res != null) {
      print(res.data);

      notificationModelST = notificationModelFromJson(jsonEncode(res.data));
      notifyListeners();
    }
    isNotificationLoading = false;
    notifyListeners();
  }

  // get teachers notificaion

  getNotificationTeachers() async {
    isNotificationLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.post, url: "getnotificationforteacher");

    if (res != null) {
      print(res.data);

      notificationModelTR = notificationModelFromJson(jsonEncode(res.data));
      notifyListeners();
    }
    isNotificationLoading = false;
    notifyListeners();
  }

  // fetch user profile

  onFetchProfile(userID, {isTcr = false}) async {
    var data = {
      "userid": userID,
    };
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.post,
        url: "getprofile",
        data: FormData.fromMap(data));

    if (res != null) {
      print(res.data);
      if (isTcr) {
        profileModelTCR = profileModelTcrFromJson(jsonEncode(res.data));
      } else {
        profileModelSTD = profileModelStdFromJson(jsonEncode(res.data));
      }
      notifyListeners();
    }
  }

  // get time table

  onFetchTimeTable() async {
    isTimeTableLoading = true;
    notifyListeners();
    final data = {
      "classid": profileModelSTD?.data.clasId,
    };
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.post,
        url: "gettimetable",
        data: FormData.fromMap(data));

    if (res != null) {
      print(res.data);

      timeTableModel = timeTableModelFromJson(jsonEncode(res.data));
      notifyListeners();
    }
    isTimeTableLoading = false;
    notifyListeners();
  }

  //! getStudents List

  onGetStudentsList() async {
    final data = {"classid": profileModelTCR?.data.classInchargeId};
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.post,
        url: "getStudentList",
        data: FormData.fromMap(data));
    if (res != null) {
      print(res.data);

      studentModel = studentModelFromJson(jsonEncode(res.data));
      notifyListeners();
    }
  }

  onMarkAttendence(context,
      {required String classID,
      required String teacherID,
      required String studentID,
      required String hour,
      required String date}) async {
    final data = {
      "classid": classID,
      "teacherid": teacherID,
      "studentid": studentID,
      "hour": hour,
      "date": date
    };
    print(data);
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.post,
        url: "markAttendance",
        data: FormData.fromMap(data));
    if (res != null) {
      print(res.data);
      showSnackBar(context, res.data["message"]);
    }
  }

bool  isAttendanceLoading =false;

  onGetAttendenceList(studentID, date) async {
    final data = {"studentid": studentID, "date": date};
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.post,
        url: "getAttendance",
        data: FormData.fromMap(data));
    if (res != null) {
      print(res.data);

      attendanceModel = attendanceModelFromJson(jsonEncode(res.data));
      notifyListeners();
    }
  }
}
