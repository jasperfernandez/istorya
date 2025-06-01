import 'dart:convert';

class MessageModel {
  final int id;
  final String content;
  final bool isRead;
  final int sentBy;
  final int conversationId;
  final DateTime createdAt;
  MessageModel({
    required this.id,
    required this.content,
    required this.isRead,
    required this.sentBy,
    required this.conversationId,
    required this.createdAt,
  });

  MessageModel copyWith({int? id, String? content, bool? isRead, int? sentBy, int? conversationId, DateTime? createdAt}) {
    return MessageModel(
      id: id ?? this.id,
      content: content ?? this.content,
      isRead: isRead ?? this.isRead,
      sentBy: sentBy ?? this.sentBy,
      conversationId: conversationId ?? this.conversationId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'isRead': isRead,
      'sentBy': sentBy,
      'conversationId': conversationId,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      content: map['content'] as String,
      isRead: map['isRead'] as bool,
      sentBy: map['sentBy'] as int,
      conversationId: map['conversationId'] as int,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(id: $id, content: $content, isRead: $isRead, sentBy: $sentBy, conversationId: $conversationId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.isRead == isRead &&
        other.sentBy == sentBy &&
        other.conversationId == conversationId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ content.hashCode ^ isRead.hashCode ^ sentBy.hashCode ^ conversationId.hashCode ^ createdAt.hashCode;
  }
}
