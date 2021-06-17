import 'dart:async';
import 'package:assignment_glints_twitter/models/tweet/tweet.dart';
import 'package:assignment_glints_twitter/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'tweet_repository_base.dart';

class TweetRepository extends TweetRepositoryBase {
  @override
  Stream<List<Tweet>> getAllTweets() {
    return FirebaseFirestore.instance
        .collection(ConstantFirestore.collectionTweets)
        .orderBy(ConstantFirestore.jsonKeyCreatedAt, descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((document) => Tweet.fromJson(document.data()))
          .toList();
    });
  }

  @override
  Future<bool> createTweet({
    required String content,
    required DateTime createdAt,
    required String createdBy,
  }) async {
    final tweetsRef = FirebaseFirestore.instance
        .collection(ConstantFirestore.collectionTweets);

    try {
      await tweetsRef.add(Tweet(
              id: tweetsRef.doc().id,
              content: content,
              createdAt: createdAt,
              createdBy: createdBy)
          .toJson());
      return true;
    } catch (e) {
      print("Failed to create new tweet: $e");
      return false;
    }
  }
}
