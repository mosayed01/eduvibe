part of 'chatbot_cubit.dart';

abstract class ChatbotState extends Equatable {
  const ChatbotState();
}

class ChatbotInitial extends ChatbotState {
  @override
  List<Object> get props => [];
}

class AskForStrategy extends ChatbotState {
  @override
  List<Object> get props => [];
}

class ChatbotLoading extends ChatbotState {
  @override
  List<Object> get props => [];
}

class SelectingChapters extends ChatbotState {
  final List<String> chapters;

  SelectingChapters(this.chapters);

  @override
  List<Object> get props => [chapters];
}

class StrategyDone extends ChatbotState {
  final List<StrategyEntity> strategy;

  StrategyDone(this.strategy);

  @override
  List<Object> get props => [strategy];
}

class GeneralChat extends ChatbotState {
  final List<MessageEntity> messages;

  GeneralChat(this.messages);

  @override
  List<Object> get props => [messages];
}
