import 'package:assignment_glints_twitter/models/tweet/tweet.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

class MockData {
  static final user = MockUser(
    isAnonymous: false,
    uid: 'abcderfg123456',
    email: 'hello@glints.com',
  );

  static final tweetA = Tweet.fromJson({
    "content": "tweet A",
    "createdAt": 1624023054979,
    "createdBy": "3Ynh7Aba1qeHBNpTUEI6dBFtXZC2",
    "id": "tweetAId",
    "updatedAt": 1624023054979,
  });

  static final tweetB = Tweet.fromJson({
    "content": "tweet B",
    "createdAt": 1624023034994,
    "createdBy": "3Ynh7Aba1qeHBNpTUEI6dBFtXZC2",
    "id": "tweetBId",
    "updatedAt": 1624023034994,
  });

  static final tweetC = Tweet.fromJson({
    "content": "tweet C",
    "createdAt": 1624023030000,
    "createdBy": "3Ynh7Aba1qeHBNpTUEI6dBFtXZC2",
    "id": "tweetCId",
    "updatedAt": 1624023040000,
  });

  static final tweetD = Tweet.fromJson({
    "content": "tweet D",
    "createdAt": 1624024030000,
    "createdBy": "3Ynh7Aba1qeHBNpTUEI6dBFtXZC2",
    "id": "tweetDId",
    "updatedAt": 1624024040000,
  });

  static final tweets = [
    tweetA,
    tweetB,
    tweetC,
  ];

  static final firestoreCollectionSnapshot = {
    MockData.tweetA.id: MockData.tweetA,
    MockData.tweetB.id: MockData.tweetB,
    MockData.tweetC.id: MockData.tweetC,
  };
}
