
class InsufficientFundsException implements Exception {
  final String message;
  InsufficientFundsException([this.message = 'Insufficient funds']);

  @override
  String toString() => 'InsufficientFundsException: $message';
}