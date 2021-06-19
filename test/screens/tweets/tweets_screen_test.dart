import 'package:assignment_glints_twitter/features/tweets/controller/tweets_controller.dart';
import 'package:assignment_glints_twitter/features/tweets/screen/tweets_screen.dart';
import 'package:assignment_glints_twitter/repositories/tweets/tweet_repository.dart';
import 'package:assignment_glints_twitter/repositories/tweets/tweet_repository_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../mock/repositories/tweets/tweet_repository_mock.mocks.dart';
import '../../mock_data/mock_data.dart';

void main() {
  late TweetRepository _tweetRepository;

  Widget _buildApp(Widget screen) {
    return GetMaterialApp(
      home: Scaffold(
        body: screen,
      ),
    );
  }

  setUp(() async {
    _tweetRepository = MockTweetRepository();
  });

  testWidgets('should render tweets screen with three tweets',
      (WidgetTester tester) async {
    // Arrange
    when(_tweetRepository.getAllTweets())
        .thenAnswer((_) => Stream.fromIterable([MockData.tweets]));

    Get.put(TweetsController());
    Get.put<TweetRepositoryBase>(_tweetRepository);

    // Act
    await tester.pumpWidget(_buildApp(TweetsScreen()));
    await tester.pumpAndSettle();

    // Assert
    MockData.tweets.forEach((element) {
      expect(find.text(element.content), findsOneWidget);
    });
  });
}
