import 'package:attendee/helpers/navigation_helper.dart';
import 'package:attendee/services/dio_service.dart';
import 'package:attendee/services/shared_pref_service.dart';
import 'package:attendee/view/screens/student/std_home.dart';
import 'package:attendee/view/screens/teacher/tcr_home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  //! login function
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLogin = false;

  SharedPrefrenceService prefrenceService = SharedPrefrenceService();

  onLogin(context) async {
    isLogin = true;
    notifyListeners();
    var data = {
      "username": userNameController.text,
      "password": passwordController.text
    };

    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.post, url: "login", data: FormData.fromMap(data));

    if (res != null) {
      print(res.data);

      if (res.data["status"]) {
        if (res.data["user"] == "student") {
          prefrenceService.saveString(res.data["userid"]);
          prefrenceService.saveUserType(res.data["user"]);
          push(context, StudentHome());
          showSnackBar(context, res.data["message"]);
        } else {
            prefrenceService.saveString(res.data["userid"]);
          prefrenceService.saveUserType(res.data["user"]);
          push(context, TeacherHome());
          showSnackBar(context, res.data["message"]);
        }
      }else{

         showSnackBar(context, res.data["message"]);
      }
      isLogin = false;
      notifyListeners();
    }
  }
}
