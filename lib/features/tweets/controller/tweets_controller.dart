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

  Future<bool> updateTweet({
    required String id,
    required String content,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
  }) async {
    return _tweetRepository.updateTweet(
      id: id,
      content: content,
      createdAt: createdAt,
      createdBy: createdBy,
      updatedAt: updatedAt,
    );
  }

  Future<bool> deleteTweet({required String id}) {
    return _tweetRepository.deleteTweet(
      id: id,
    );
  }
}
