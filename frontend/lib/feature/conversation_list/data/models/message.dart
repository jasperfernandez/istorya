import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
sealed class Message with _$Message {
  const factory Message({
    required int id,
    required String content,
    required bool isRead,
    required int sentBy,
    required int conversationId,
    required DateTime createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
