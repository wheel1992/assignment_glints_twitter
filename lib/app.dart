import 'package:assignment_glints_twitter/features/login/controller/login_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/login/screen/login_screen.dart';

class GlintApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _GlintAppState createState() => _GlintAppState();
}

class _GlintAppState extends State<GlintApp> {
  @override
  void initState() {
    super.initState();
    Get.put(LoginController());
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Firebase.initializeApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Glints Twitter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
