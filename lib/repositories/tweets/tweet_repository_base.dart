import 'dart:async';
import 'package:assignment_glints_twitter/models/tweet/tweet.dart';

abstract class TweetRepositoryBase {
  Stream<List<Tweet>> getAllTweets();

  Future<bool> createTweet({
    required String content,
    required DateTime createdAt,
    required String createdBy,
  });
}
