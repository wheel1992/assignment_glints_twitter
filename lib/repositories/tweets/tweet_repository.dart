import 'dart:async';
import 'package:assignment_glints_twitter/models/tweet/tweet.dart';
import 'package:assignment_glints_twitter/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'tweet_repository_base.dart';

class TweetRepository extends TweetRepositoryBase {
  late FirebaseFirestore _firestore;

  TweetRepository(FirebaseFirestore firestore) {
    _firestore = firestore;
  }

  CollectionReference<Map<String, dynamic>> _getCollectionTweetsReference() =>
      _firestore.collection(ConstantFirestore.collectionTweets);

  @override
  Stream<List<Tweet>> getAllTweets() {
    return _firestore
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
    final tweetsRef = _getCollectionTweetsReference();
    final newDocRef = tweetsRef.doc();

    try {
      await newDocRef.set(Tweet(
        id: newDocRef.id,
        content: content,
        createdAt: createdAt,
        createdBy: createdBy,
        updatedAt: createdAt,
      ).toJson());
      return true;
    } catch (e) {
      print("Failed to create new tweet: $e");
      return false;
    }
  }

  @override
  Future<bool> updateTweet({
    required String id,
    required String content,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
  }) async {
    final tweetsRef = _getCollectionTweetsReference();
    try {
      await tweetsRef.doc(id).update(Tweet(
            id: id,
            content: content,
            createdAt: createdAt,
            createdBy: createdBy,
            updatedAt: updatedAt,
          ).toJson());
      return true;
    } catch (e) {
      print("Failed to update tweet: $e");
      return false;
    }
  }

  @override
  Future<bool> deleteTweet({
    required String id,
  }) async {
    final tweetsRef = _getCollectionTweetsReference();
    try {
      await tweetsRef.doc(id).delete();
      return true;
    } catch (e) {
      print("Failed to delete tweet: $e");
      return false;
    }
  }
}
