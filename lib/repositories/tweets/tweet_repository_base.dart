import 'dart:async';
import 'package:assignment_glints_twitter/models/tweet/tweet.dart';

abstract class TweetRepositoryBase {
  Stream<List<Tweet>> getAllTweets();

  Future<bool> createTweet({
    required String content,
    required DateTime createdAt,
    required String createdBy,
  });

  Future<bool> updateTweet({
    required String id,
    required String content,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
  });

  Future<bool> deleteTweet({
    required String id,
  });
}
