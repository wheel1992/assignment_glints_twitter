import 'package:assignment_glints_twitter/features/tweets/controller/tweets_controller.dart';
import 'package:assignment_glints_twitter/features/tweets/screen/create_tweet_screen.dart';
import 'package:assignment_glints_twitter/models/tweet/tweet.dart';
import 'package:assignment_glints_twitter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TweetsScreen extends StatefulWidget {
  const TweetsScreen({Key? key}) : super(key: key);

  @override
  _TweetsScreenState createState() => _TweetsScreenState();
}

class _TweetsScreenState extends State<TweetsScreen> {
  TweetsController _tweetsController = Get.find();

  @override
  void initState() {
    super.initState();
    _tweetsController.init(tweetRepository: Get.find());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tweets'),
        actions: [
          FlatButton.icon(
            onPressed: handleOnButtonCreate,
            icon: Icon(
              Icons.add,
            ),
            label: Text('Create tweet'),
          ),
        ],
      ),
      body: Container(
        child: SafeArea(
          child: renderListTweets(),
        ),
      ),
    );
  }

  Widget renderListTweets() {
    return StreamBuilder<List<Tweet>>(
      stream: _tweetsController.getAllTweets(),
      builder: (BuildContext context, AsyncSnapshot<List<Tweet>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return Text('Loading');
            }
          default:
            {
              print(snapshot.data);
              return ListView(
                children: snapshot.data!.map((Tweet tweet) {
                  return ListTile(
                    title: Text(tweet.content),
                    subtitle: Text(tweet.createdAt.toLocal().toString()),
                  );
                }).toList(),
              );
            }
        }
      },
    );
  }

  void handleOnButtonCreate() {
    navigateToCreateTweetScreen();
  }

  void navigateToCreateTweetScreen() {
    Get.toNamed(ConstantRoute.tweetCreate);
  }
}
