import 'package:eduvibe/domain/chatbot/models.dart';

abstract class IChatRepo {
  Future<List<MessageEntity>> botReply(List<MessageEntity> messages);
}