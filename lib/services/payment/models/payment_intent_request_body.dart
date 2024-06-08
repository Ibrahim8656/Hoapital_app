class PaymentIntentRequestBody {
  final String amount, currency, customerId;

  const PaymentIntentRequestBody({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency,
        'customer': customerId,
      };
}
