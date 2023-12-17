import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

push(BuildContext context, page) {
  Navigator.push(
    context,
   _slideTransition(page),
  );
}

pushAndReplace(BuildContext context, page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}

pushAndRemoveUntil(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
    context,
    _slideTransition(page),
    (_) => false,
  );
}

pushAndRemoveUntilSlide(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
    (_) => false,
  );
}

pushNamedAndRemoveUntil(BuildContext context, page) {
  Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
}


Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _slideTransition(Widget page){
 return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
  

      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );

}

//!

showSnackBar(BuildContext context, String message,
    {Color? color, Duration? duration, double margin = 10,SnackBarAction? action}) {
       ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    action: action,
    margin: EdgeInsets.only(bottom: margin),
    elevation: 5.0,
    behavior: SnackBarBehavior.floating,
    duration: duration ?? const Duration(seconds: 1),
    content: Text(message),
    backgroundColor: color ?? Colors.blue,
  ));
}

//! 



class MyPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (route.settings.name == '/audioPlayer') {
      // Apply a slide transition from bottom to top for the home route
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    } else {
      // Apply a fade transition for other routes
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
  }
}
