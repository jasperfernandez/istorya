// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      name: json['name'] as String?,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: (json['createdBy'] as num).toInt(),
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
    };
