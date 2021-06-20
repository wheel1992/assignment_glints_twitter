import 'package:assignment_glints_twitter/features/tweets/controller/tweets_controller.dart';
import 'package:assignment_glints_twitter/features/tweets/screen/manage_tweet_screen.dart';
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
        title: Text(ConstantText.titleTweets),
        actions: [
          IconButton(
            onPressed: handleOnButtonCreate,
            icon: Icon(
              Icons.add,
            ),
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

  Widget renderListItemTweet(Tweet tweet) {
    return ListTile(
      title: Text(tweet.content),
      subtitle: Text(tweet.createdAt!.toLocal().toString()),
      trailing: renderListItemMenuOption(tweet),
    );
  }

  Widget renderListItemMenuOption(Tweet tweet) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text(ConstantText.menuEdit),
              onTap: () {
                handleOnListItemTweetEditPressed(tweet);
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.delete_forever),
              title: Text(ConstantText.menuDelete),
              onTap: () {
                handleOnListItemTweetDeletePressed(tweet);
              },
            ),
          ),
        ];
      },
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
            return Column(
              children: [
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: CircularProgressIndicator(),
                ),
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
            );
          default:
            return ListView(
              children: snapshot.data!
                  .map((Tweet tweet) => renderListItemTweet(tweet))
                  .toList(),
            );
        }
      },
    );
  }

  Future<void> showDeleteTweetConfirmationDialog(Tweet tweet) async {
    // Setup buttons
    Widget cancelButton = FlatButton(
      child: Text(ConstantText.dialogTweetDeleteOptionCancel),
      onPressed: () {
        Get.back();
      },
    );
    Widget confirmButton = FlatButton(
      child: Text(ConstantText.dialogTweetDeleteOptionConfirm),
      onPressed: () async {
        await _tweetsController.deleteTweet(id: tweet.id);
        Get.back();
      },
    );

    // Setup AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(ConstantText.dialogTweetDeleteTitle),
      content: Text(ConstantText.dialogTweetDeleteMessage),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );

    // Show dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void handleOnListItemTweetEditPressed(Tweet tweet) {
    navigateToManageTweetScreen(tweet: tweet);
  }

  void handleOnListItemTweetDeletePressed(Tweet tweet) {
    showDeleteTweetConfirmationDialog(tweet);
  }

  void handleOnButtonCreate() {
    navigateToManageTweetScreen();
  }

  void navigateToManageTweetScreen({Tweet? tweet}) {
    Get.toNamed(
      ConstantRoute.tweetManage,
      arguments: ManageTweetScreenArgument(
        type: tweet == null
            ? ManageTweetScreenType.create
            : ManageTweetScreenType.edit,
        tweet: tweet,
      ),
    );
  }
}
