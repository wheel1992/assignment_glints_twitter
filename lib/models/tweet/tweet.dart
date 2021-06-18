import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'tweet.g.dart';

@JsonSerializable()
class Tweet {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'content', defaultValue: '')
  final String content;

  @JsonKey(
    name: 'createdAt',
    fromJson: convertTimestampToDateTime,
    toJson: convertDateTimeToTimestamp,
  )
  final DateTime? createdAt;

  @JsonKey(name: 'createdBy')
  final String createdBy;

  @JsonKey(
    name: 'updatedAt',
    fromJson: convertTimestampToDateTime,
    toJson: convertDateTimeToTimestamp,
  )
  final DateTime? updatedAt;

  Tweet({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
  });

  @override
  String toString() =>
      'Tweet: { ${JsonEncoder.withIndent(" ").convert(_$TweetToJson(this))} }';

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  Map<String, dynamic> toJson() => _$TweetToJson(this);

  Tweet copyWith({
    String? id,
    String? content,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
  }) {
    return Tweet(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  static DateTime? convertTimestampToDateTime(dynamic val) {
    if (val is int) {
      if (val > 0) {
        return DateTime.fromMillisecondsSinceEpoch(val, isUtc: true).toLocal();
      }
    }

    if (val is String) {
      return DateTime.fromMillisecondsSinceEpoch(
              int.tryParse(val, radix: 10) ?? 0,
              isUtc: true)
          .toLocal();
    }

    return null;
  }

  static int? convertDateTimeToTimestamp(DateTime? val) {
    if (val == null) {
      return 0;
    }
    return val.millisecondsSinceEpoch;
  }
}
