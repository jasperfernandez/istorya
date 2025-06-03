import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
sealed class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    String? name,
    required String type,
    required DateTime createdAt,
    required int createdBy,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
