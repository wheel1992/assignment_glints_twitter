import 'package:assignment_glints_twitter/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class GlintApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glints Twitter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
