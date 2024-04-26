class StrategyEntity {
  final String title;
  final List<String> steps;

  StrategyEntity(this.title, this.steps);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StrategyEntity && other.title == title && other.steps == steps;
  }

  @override
  int get hashCode => title.hashCode ^ steps.hashCode;

  @override
  String toString() => 'StrategyUI(title: $title, steps: $steps)';

  StrategyEntity copyWith({
    String? title,
    List<String>? steps,
  }) {
    return StrategyEntity(
      title ?? this.title,
      steps ?? this.steps,
    );
  }
}

class MessageEntity {
  final String username;
  final String message;
  final bool isUser;

  MessageEntity(this.message, this.isUser, this.username);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageEntity && other.message == message && other.isUser == isUser && other.username == username;
  }

  @override
  int get hashCode => message.hashCode ^ isUser.hashCode ^ username.hashCode;

  @override
  String toString() => 'MessageUI(message: $message, isUser: $isUser, username: $username)';

  MessageEntity copyWith({
    String? username,
    String? message,
    bool? isUser,
  }) {
    return MessageEntity(
      message ?? this.message,
      isUser ?? this.isUser,
      username ?? this.username,
    );
  }
}
