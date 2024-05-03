import 'package:bloc/bloc.dart';
import 'package:eduvibe/domain/chatbot/i_chat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/chatbot/models.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit(this._chatRepo) : super(ChatbotInitial());
  final IChatRepo _chatRepo;

  final messageTextController = TextEditingController();

  void askForStrategy() {
    emit(AskForStrategy());
  }

  void selectChapters(List<String> chapters) {
    emit(SelectingChapters(chapters));
  }

  void strategyDone(List<StrategyEntity> strategy) {
    emit(StrategyDone(strategy));
  }

  // region chat methods
  void generalChat() {
    emit(GeneralChat([]));
  }

  Future<void> addMessage() async {
    final currentState = state;
    if (currentState is GeneralChat) {
      try {
        final messages = currentState.messages;
        final message = messageTextController.text.trim();
        if (message.isEmpty) {
          emit(GeneralChat(messages));
          return;
        }
        messageTextController.clear();
        messages.add(MessageEntity(message, true, 'Mohammed'));
        emit(GeneralChat(messages));
        _botReply(messages);
      } catch (e) {
        emit(GeneralChat([MessageEntity('Error: $e', false, 'Bot')]));
      }
    }
  }

  Future<void> _botReply(List<MessageEntity> messages) async {
    if (!messages.last.isUser) {
      messages.removeLast();
    }
    messages = await _chatRepo.botReply(messages);
    emit(ChatbotLoading());
    emit(GeneralChat(messages));
  }
// endregion
}
