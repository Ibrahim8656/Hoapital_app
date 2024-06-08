import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/services/payment/logic/stripe_service.dart';
import 'package:hosptial_project/services/payment/models/payment_intent_request_body.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  Future<void> pay(
    PaymentIntentRequestBody paymentIntentRequestBody,
  ) async {
    emit(PaymentLoading());
    try {
      final StripeService stripeService = StripeService();
      await stripeService.pay(paymentIntentRequestBody);
      emit(PaymentSuccess());
    } catch (e) {
      emit(PaymentFailure(failure: e.toString()));
    }
  }
}
