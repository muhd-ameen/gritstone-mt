// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:ecommerceapiqa/view/app/navigation_page.dart';
import 'package:ecommerceapiqa/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, () async {
      await navigationPage();
    });
  }

  Future navigationPage() async {
    String? token = await storage.read(key: "token");
    if (token != null) {
    Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => NavigationPage()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x09000000),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: Offset(0, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset('assets/images/appIcon.png')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
