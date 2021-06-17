// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return Tweet(
    id: json['id'] as String,
    content: json['content'] as String? ?? '',
    createdAt: json['createdAt'] as String,
    createdBy: json['createdBy'] as String,
  );
}

Map<String, dynamic> _$TweetToJson(Tweet instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
    };
