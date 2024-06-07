class CreditCardAccount {
  final String name;
  final double balance;
  final double limit;
  final double utilizationPercentage;
  final String reportedDate;

  CreditCardAccount({
    required this.name,
    required this.balance,
    required this.limit,
    required this.utilizationPercentage,
    required this.reportedDate,
  });
}
