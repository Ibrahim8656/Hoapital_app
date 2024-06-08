import 'tip.dart';

class AmountDetails {
  Tip? tip;

  AmountDetails({this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(
      tip: json['tip'] == null
          ? null
          : Tip.fromJson(json['tip'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tip': tip?.toJson(),
    };
  }
}
