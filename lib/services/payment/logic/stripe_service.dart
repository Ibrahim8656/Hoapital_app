import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hosptial_project/services/payment/models/ephemeral_key_response_body/ephemeral_key_response_body.dart';
import 'package:hosptial_project/services/payment/models/payment_intent_request_body.dart';
import 'package:hosptial_project/services/payment/models/payment_intent_response/payment_intent_response.dart';
import 'package:hosptial_project/services/payment/models/payment_sheet_params.dart';
import 'package:hosptial_project/services/payment/payment_api_keys.dart';
import 'package:hosptial_project/services/payment/logic/payment_api_service.dart';

class StripeService {
  final PaymentApiService _apiService = PaymentApiService();

  Future<PaymentIntentResponse> _createPaymentIntent(
    PaymentIntentRequestBody paymentIntentRequestBody,
  ) async {
    var response = await _apiService.post(
      body: paymentIntentRequestBody.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
    );

    final paymentIntent = PaymentIntentResponse.fromJson(response.data);

    return paymentIntent;
  }

  Future<void> _initPaymentSheet({
    required PaymentSheetParams paymentSheetParams,
    String merchantDisplayName = 'Ahmed Ghaly',
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentSheetParams.paymentIntentClientSecret,
        customerEphemeralKeySecret:
            paymentSheetParams.customerEphemeralKeySecret,
        customerId: paymentSheetParams.customerId,
        merchantDisplayName: merchantDisplayName,
      ),
    );
  }

  Future<void> _displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> pay(
    PaymentIntentRequestBody paymentIntentRequestBody,
  ) async {
    var paymentIntent = await _createPaymentIntent(
      paymentIntentRequestBody,
    );

    var ephemeralKey = await _createEphemeralKey(
      customerId: paymentIntentRequestBody.customerId,
    );

    await _initPaymentSheet(
      paymentSheetParams: PaymentSheetParams(
        paymentIntentClientSecret: paymentIntent.clientSecret!,
        customerId: paymentIntentRequestBody.customerId,
        customerEphemeralKeySecret: ephemeralKey.secret,
      ),
    );

    await _displayPaymentSheet();
  }

  Future<EphemeralKeyResponseBody> _createEphemeralKey({
    required String customerId,
  }) async {
    var response = await _apiService.post(
      body: {
        'customer': customerId,
      },
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      headers: {
        'Authorization': "Bearer ${PaymentApiKeys.secretKey}",
        'Stripe-Version': '2023-08-16',
      },
    );

    final ephemeralKey = EphemeralKeyResponseBody.fromJson(response.data);

    return ephemeralKey;
  }
}
