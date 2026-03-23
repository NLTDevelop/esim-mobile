


abstract interface  class StatusTransactionRepository{

  Future<String?> fetchLastTransactionId();

  Future<void> saveLastTransaction(String transactionId);
}