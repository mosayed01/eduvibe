import 'package:dio/dio.dart';

import '../../domain/chatbot/i_chat_repo.dart';
import '../../domain/chatbot/models.dart';
import 'dto.dart';

class ChatRepo implements IChatRepo {
  final Dio _dio;

  ChatRepo(this._dio);

  @override
  Future<List<MessageEntity>> botReply(List<MessageEntity> messages) async {
    if (!messages.last.isUser) {
      messages.removeLast();
    }
    final data = messages
        .map((m) => Contents(
            role: !m.isUser ? 'model' : 'user',
            parts: [Parts(text: m.message)]))
        .toList();
    final response = await _dio.post(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyAk3CzlFKmtKq6ju6FG-OaVEiSktZl-x00',
      data: ContentsDto(contents: data).toJson(),
    );
    final responseDto = ResponseDto.fromJson(response.data);
    final botMessages = responseDto.candidates
        .map((c) => c.content.parts.map((p) => p.text).join())
        .toList();
    messages.addAll(
        botMessages.map((m) => MessageEntity(m, false, 'Bot')).toList());
    return messages;
  }
}
