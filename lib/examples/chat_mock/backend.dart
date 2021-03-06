import 'model.dart';

typedef OnChatMessageCallback = void Function(int index, ChatMessage message);

abstract class ChatManager {
  ChatManager();
  ChatSession getNamedSession(String name);
}

abstract class ChatSession {
  ChatSession(this.name);
  final String name;

  ChatMessage operator [](int index);
  int get messageCount;

  double get rating;

  OnChatMessageCallback onMessageInserted;
  OnChatMessageCallback onMessageRemoved;

  void sendMessage(String text);
  void start();
  void close();
}