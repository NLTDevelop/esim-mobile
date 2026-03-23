
import 'dart:async';

class AuthEventBus {
  AuthEventBus._();

  static final instance = AuthEventBus._();

  final _controller = StreamController<void>.broadcast();

  Stream<void> get onLogout => _controller.stream;

  void logout() {
    _controller.add(null);
  }
}