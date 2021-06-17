import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'tweet.g.dart';

@JsonSerializable()
class Tweet {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'content', defaultValue: '')
  final String content;

  @JsonKey(name: 'createdAt')
  final String createdAt;

  @JsonKey(name: 'createdBy')
  final String createdBy;

  Tweet({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.createdBy,
  });

  @override
  String toString() =>
      'Tweet: { ${JsonEncoder.withIndent(" ").convert(_$TweetToJson(this))} }';

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  Map<String, dynamic> toJson() => _$TweetToJson(this);

  Tweet copyWith({
    String? id,
    String? content,
    String? createdAt,
    String? createdBy,
  }) {
    return Tweet(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
