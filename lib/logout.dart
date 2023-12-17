import 'package:attendee/helpers/navigation_helper.dart';
import 'package:attendee/services/shared_pref_service.dart';
import 'package:attendee/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignOutPage extends StatefulWidget {
  @override
  _SignOutPageState createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {
  String appVersion = "";
  String appName = "";
  String buildNumber = "";

  @override
  void initState() {
    super.initState();
    getAppInfo();
  }

  Future<void> getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
      appName = packageInfo.appName;
      buildNumber = packageInfo.buildNumber;
    });
  }

  void confirmSignOut() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform sign-out logic here
                // You can navigate to the login page or clear user data
                // and show a sign-out success message.
                SharedPrefrenceService.prefs.clear();
                Fluttertoast.showToast(msg: 'Signed out successfully');
                pushAndRemoveUntil(context,const LoginScreen());
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.info, size: 100, color: Colors.blue),
            Text(appName),
            Text('Version $appVersion (Build $buildNumber)'),
            ElevatedButton(
              onPressed: confirmSignOut,
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
