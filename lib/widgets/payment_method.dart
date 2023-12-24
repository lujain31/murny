import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key, required this.paymentMethod});
  final String paymentMethod;
  @override
  Widget build(BuildContext context) {
    String iconPath = "";
    switch (paymentMethod) {
      case "نقداً":
        iconPath = "assets/money_icon.png";
      case "البطاقة الائتمانية":
        iconPath = "assets/credit_card_icon.png";
      case "ابل باي":
        iconPath = "assets/appel_pay_icon.png";
    }
    return Row(
      children: [
        Image.asset(iconPath),
        SizedBox(
          width: MediaQuery.of(context).size.width / 22,
        ),
        Text(paymentMethod)
      ],
    );
  }
}
