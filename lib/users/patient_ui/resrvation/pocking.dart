import 'package:flutter/cupertino.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: CupertinoColors.white,
      child: Center(child: Text("Go to payment ")),
    );
  }
}
