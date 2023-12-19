import 'package:attendee/services/shared_pref_service.dart';
import 'package:attendee/view/provider/home_provider.dart';
import 'package:attendee/view/screens/teacher/src_student.dart';
import 'package:attendee/view/screens/teacher/tcr_attendance.dart';
import 'package:attendee/view/screens/teacher/tcr_intro.dart';
import 'package:attendee/view/screens/teacher/tcr_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class TeacherHome extends StatefulWidget {
  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  int _selectedIndex = 0;

  SharedPrefrenceService prefrenceService = SharedPrefrenceService();

  static List<Widget Function()> _widgetOptions = [
    () => TeacherNotificationPage(),

    () => StudentSearch(),
    () => TeacherAttendancePage(),
    () => TeacherProfilePage(), // Create an instance directly
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.getNotificationTeachers();
      String userID = prefrenceService.getString();
      homePro.onFetchProfile(userID, isTcr: true);
      homePro.onGetStudentsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 20,
          title: Text(
            'Teacher',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromRGBO(233, 240, 255, 1),
          iconTheme: IconThemeData(color: Colors.black)),
      body: Center(
        child: _widgetOptions[_selectedIndex](),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.searchengin,
                    text: 'Student',
                  ),
                  GButton(
                    icon: LineIcons.checkCircleAlt,
                    text: 'Attendence',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  // if (index == 3) {
                  //   _navigateToProfilePage();
                  // } else {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
