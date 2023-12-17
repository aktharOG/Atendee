import 'package:attendee/services/shared_pref_service.dart';
import 'package:attendee/view/provider/auth_provider.dart';
import 'package:attendee/view/provider/home_provider.dart';
import 'package:attendee/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
   WidgetsFlutterBinding.ensureInitialized();
   SharedPrefrenceService().init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> AuthProvider()),
       ChangeNotifierProvider(create: (_)=> HomeProvider()),
    ],
    child: MaterialApp(
      title: 'Login ',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  ));
}
