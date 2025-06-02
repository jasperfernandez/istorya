// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: (json['id'] as num).toInt(),
  content: json['content'] as String,
  isRead: json['isRead'] as bool,
  sentBy: (json['sentBy'] as num).toInt(),
  conversationId: (json['conversationId'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'isRead': instance.isRead,
  'sentBy': instance.sentBy,
  'conversationId': instance.conversationId,
  'createdAt': instance.createdAt.toIso8601String(),
};
