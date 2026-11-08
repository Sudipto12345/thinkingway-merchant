enum PaymentStatus { success, pending, failed, reversed }

class TransactionModel {
  final String id;
  final String providerRef;
  final String title;
  final String channel;
  final double amount;
  final DateTime timestamp;
  final PaymentStatus status;
  final bool verifiedByPartner;

  const TransactionModel({
    required this.id,
    required this.providerRef,
    required this.title,
    required this.channel,
    required this.amount,
    required this.timestamp,
    required this.status,
    this.verifiedByPartner = true,
  });
}
