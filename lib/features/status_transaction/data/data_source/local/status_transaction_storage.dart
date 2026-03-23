
abstract interface class StatusTransactionStorage {
  Future<void> saveLastTransaction(String transactionId);

  Future<String?> getLastTransactionId();

}
