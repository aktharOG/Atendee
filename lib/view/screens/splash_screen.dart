import 'dart:async';
import 'dart:developer';

import 'package:attendee/helpers/navigation_helper.dart';
import 'package:attendee/main.dart';
import 'package:attendee/services/shared_pref_service.dart';
import 'package:attendee/view/screens/auth/login_screen.dart';
import 'package:attendee/view/screens/student/std_home.dart';
import 'package:attendee/view/screens/teacher/tcr_home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPrefrenceService prefrenceService = SharedPrefrenceService();
  onSplash() {
    Timer(const Duration(seconds: 3), () {
      final userID = prefrenceService.getString();
       final userType = prefrenceService.getUserType() ?? '';
      if (userID != null) {
        log(userType);
        if(userType=="teacher"){
          
        pushAndRemoveUntil(context, TeacherHome());

        }else{
        pushAndRemoveUntil(context, StudentHome());

        }
      } else {
        pushAndRemoveUntil(context, const LoginScreen());
      }
    });
  }
        @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onSplash();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Attendee',
          style: TextStyle(
              fontSize: 48,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(66, 69, 93, 172)),
        ),
      ),
    );
  }
}
