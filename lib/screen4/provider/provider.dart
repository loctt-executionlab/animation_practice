import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageProvider =
    StateNotifierProvider<MessageNotifier, List<String>>((ref) {
  return MessageNotifier();
});

class MessageNotifier extends StateNotifier<List<String>> {
  MessageNotifier() : super([]);

  void addMessage(String message) {
    print(message);
    print(state.length);
    state = [...state, message];
  }
}
