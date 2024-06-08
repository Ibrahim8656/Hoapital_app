class PaymentSheetParams {
  final String? paymentIntentClientSecret;
  final String? customerEphemeralKeySecret;
  final String? customerId;

  const PaymentSheetParams({
    this.paymentIntentClientSecret,
    this.customerEphemeralKeySecret,
    this.customerId,
  });
}
