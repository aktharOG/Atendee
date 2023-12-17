// import 'package:attendee/teacher/tcr_home.dart';
import 'package:attendee/view/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:attendee/config.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isChecked = false;
    final authPro = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          //  Image.asset("images/primaryBg.png"),

          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Attendee',
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 10.0,
                          color: Color.fromARGB(36, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 1.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                      fontSize: 48,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(66, 69, 93, 172)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          color: Colors.grey,
                          blurRadius: 10)
                    ],
                    color: layerTwoBg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(0.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      const Positioned(
                        left: 59,
                        top: 99,
                        child: Text(
                          'Username',
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                          left: 59,
                          top: 129,
                          child: SizedBox(
                            width: 310,
                            child: TextField(
                              controller: authPro.userNameController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter User ID or Email',
                                hintStyle: TextStyle(color: hintText),
                              ),
                            ),
                          )),
                      const Positioned(
                        left: 59,
                        top: 199,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                          left: 59,
                          top: 229,
                          child: SizedBox(
                            width: 310,
                            child: TextField(
                              controller: authPro.passwordController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(color: hintText),
                              ),
                            ),
                          )),
                      const Positioned(
                          right: 60,
                          top: 296,
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: forgotPasswordText,
                                fontSize: 16,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w600),
                          )),
                      Positioned(
                        top: 365,
                        right: 60,
                        child: authPro.isLogin
                            ? const CircularProgressIndicator()
                            : GestureDetector(
                                onTap: () {
                                  authPro.onLogin(context);
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) => StudentHome()));
                                },
                                child: Container(
                                  width: 99,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                    color: signInButton,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      'Sign In',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Poppins-Medium',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
