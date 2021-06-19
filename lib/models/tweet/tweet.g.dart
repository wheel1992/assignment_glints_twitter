// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return Tweet(
    id: json['id'] as String,
    content: json['content'] as String? ?? '',
    createdAt: Tweet.convertTimestampToDateTime(json['createdAt']),
    createdBy: json['createdBy'] as String,
    updatedAt: Tweet.convertTimestampToDateTime(json['updatedAt']),
  );
}

Map<String, dynamic> _$TweetToJson(Tweet instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': Tweet.convertDateTimeToTimestamp(instance.createdAt),
      'createdBy': instance.createdBy,
      'updatedAt': Tweet.convertDateTimeToTimestamp(instance.updatedAt),
    };
