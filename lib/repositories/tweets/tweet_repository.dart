import 'dart:async';
import 'package:assignment_glints_twitter/models/tweet/tweet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'tweet_repository_base.dart';

class TweetRepository extends TweetRepositoryBase {
  @override
  Stream<List<Tweet>> getAllTweets() {
    return FirebaseFirestore.instance
        .collection('tweets')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((document) => Tweet.fromJson(document.data()))
          .toList();
    });
  }
}
