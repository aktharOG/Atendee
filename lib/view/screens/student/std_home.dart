import 'package:attendee/services/shared_pref_service.dart';
import 'package:attendee/view/provider/home_provider.dart';
import 'package:attendee/view/screens/student/std_attendence.dart';
import 'package:attendee/view/screens/student/std_intro.dart';
import 'package:attendee/view/screens/student/std_profile.dart';
import 'package:attendee/view/screens/student/std_timetable.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  int _selectedIndex = 0;
  SharedPrefrenceService prefrenceService = SharedPrefrenceService();

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static final List<Widget Function()> _widgetOptions = [
    () => const StudentNotificationPage(),
    () => StudentTimetablePage(),
    () => StudentAttendancePage(),
    () => StudentProfilePage(), // Create an instance directly
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.getNotificationStudents();
      String userID = prefrenceService.getString();
      homePro.onFetchProfile(userID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 20,
          title: const Text(
            'Student',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: const Color.fromRGBO(233, 240, 255, 1),
          iconTheme: const IconThemeData(color: Colors.black)),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  const GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  const GButton(
                    icon: LineIcons.calendarMinus,
                    text: 'Timetable',
                  ),
                  const GButton(
                    icon: LineIcons.checkCircleAlt,
                    text: 'Attendence',
                  ),
                  const GButton(
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
