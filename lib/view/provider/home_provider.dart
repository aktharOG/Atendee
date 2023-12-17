import 'dart:convert';

import 'package:attendee/services/dio_service.dart';
import 'package:attendee/view/model/notification_model.dart';
import 'package:attendee/view/model/profile_model_std.dart';
import 'package:attendee/view/model/profile_model_tcr.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  NotificationModel? notificationModelST; //student
  NotificationModel? notificationModelTR; //teacher

  ProfileModelStd? profileModelSTD; // profile data std
  ProfileModelTcr? profileModelTCR;

  bool isNotificationLoading = false;

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
}
