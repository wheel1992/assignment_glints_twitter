import 'package:assignment_glints_twitter/models/tweet/tweet.dart';
import 'package:assignment_glints_twitter/repositories/tweets/tweet_repository.dart';
import 'package:assignment_glints_twitter/utils/constants.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mock_data/mock_data.dart';

void main() {
  late TweetRepository _tweetRepository;
  late FakeFirebaseFirestore _firestore;

  setUp(() async {
    _firestore = FakeFirebaseFirestore();
    await _firestore
        .collection(ConstantFirestore.collectionTweets)
        .doc(MockData.tweetA.id)
        .set(MockData.tweetA.toJson());
    await _firestore
        .collection(ConstantFirestore.collectionTweets)
        .doc(MockData.tweetB.id)
        .set(MockData.tweetB.toJson());
    await _firestore
        .collection(ConstantFirestore.collectionTweets)
        .doc(MockData.tweetC.id)
        .set(MockData.tweetC.toJson());

    _tweetRepository = TweetRepository(_firestore);
  });

  test('should returm all tweets which are stored in firestore', () async {
    // Arrange
    // Since Firestore is faked at setUp, no arrangement is required

    // Act
    final _result = _tweetRepository.getAllTweets();

    // Assert
    _result.listen(expectAsync1((List<Tweet> tweets) {
      expect(tweets.length, 3);
    }, count: 1));
  });

  test('should create a new tweet, TweetD', () async {
    // Arrange
    // Since Firestore is faked at setUp, no arrangement is required

    // Act
    final _result = await _tweetRepository.createTweet(
      content: MockData.tweetD.content,
      createdAt: MockData.tweetD.createdAt!,
      createdBy: MockData.tweetD.createdBy,
    );

    // Assert
    expect(_result, true);
    final snapshot =
        await _firestore.collection(ConstantFirestore.collectionTweets).get();
    expect(snapshot.docs.length, 4);
  });

  test('should delete a tweet, TweetD', () async {
    // Arrange
    // Since Firestore is faked at setUp, no arrangement is required

    // Act
    // final _result = await _tweetRepository.createTweet(
    //   content: MockData.tweetD.content,
    //   createdAt: MockData.tweetD.createdAt!,
    //   createdBy: MockData.tweetD.createdBy,
    // );

    // // Assert
    // expect(_result, true);
    final snapshot = await _firestore.collection('tweets').get();
    print(snapshot.docs.length);
    expect(snapshot.docs.length, 4);
  });
}
