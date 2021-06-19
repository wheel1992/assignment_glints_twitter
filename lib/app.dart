import 'package:assignment_glints_twitter/features/login/controller/login_controller.dart';
import 'package:assignment_glints_twitter/features/tweets/controller/tweets_controller.dart';
import 'package:assignment_glints_twitter/features/tweets/screen/manage_tweet_screen.dart';
import 'package:assignment_glints_twitter/features/tweets/screen/tweets_screen.dart';
import 'package:assignment_glints_twitter/repositories/auth/auth_repository_base.dart';
import 'package:assignment_glints_twitter/repositories/auth/auth_respository.dart';
import 'package:assignment_glints_twitter/repositories/tweets/tweet_repository.dart';
import 'package:assignment_glints_twitter/repositories/tweets/tweet_repository_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment_glints_twitter/utils/constants.dart';

import 'features/login/screen/login_screen.dart';

class GlintApp extends StatefulWidget {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  GlintApp({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  _GlintAppState createState() => _GlintAppState();
}

class _GlintAppState extends State<GlintApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: 'Glints Twitter',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: ConstantRoute.root,
            routes: {
              ConstantRoute.root: (context) => LoginScreen(),
              ConstantRoute.tweets: (context) => TweetsScreen(),
              ConstantRoute.tweetManage: (context) => ManageTweetScreen(),
            },
          );
        }

        return Container();
      },
    );
  }

  Future<void> init() async {
    // Initialise repositories
    final _authRespository = AuthRepository();
    _authRespository.setup(auth: widget.firebaseAuth);
    Get.put<AuthRepositoryBase>(_authRespository);

    final _tweetRepository = TweetRepository(widget.firebaseFirestore);
    Get.put<TweetRepositoryBase>(_tweetRepository);

    // Initialise controllers
    Get.put(LoginController());
    Get.put(TweetsController());
  }
}
