import 'package:assignment_glints_twitter/models/tweet/tweet.dart';
import 'package:assignment_glints_twitter/repositories/tweets/tweet_repository_base.dart';
import 'package:get/get.dart';

class TweetsController extends GetxController {
  late TweetRepositoryBase _tweetRepository;

  init({required TweetRepositoryBase tweetRepository}) {
    _tweetRepository = tweetRepository;
  }

  Stream<List<Tweet>> getAllTweets() {
    return _tweetRepository.getAllTweets();
  }

  Future<bool> createTweet({
    required String content,
    required String userId,
  }) async {
    return _tweetRepository.createTweet(
      content: content,
      createdAt: DateTime.now(),
      createdBy: userId,
    );
  }
}
