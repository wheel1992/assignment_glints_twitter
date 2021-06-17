import 'dart:async';
import 'package:assignment_glints_twitter/models/tweet/tweet.dart';

abstract class TweetRepositoryBase {
  Stream<List<Tweet>> getAllTweets();
}
