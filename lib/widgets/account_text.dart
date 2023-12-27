import 'package:flutter/material.dart';

class AccountText extends StatelessWidget {
  const AccountText(
      {super.key, required this.firstText, required this.secondText});
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(secondText,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Mulish-Reg',
                color: Color(0xff000000))),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
            onTap: () {},
            child: Text(firstText,
                textDirection: TextDirection.rtl,
                style:
                    const TextStyle(fontSize: 16, color: Color(0xff252C63)))),
      ],
    );
  }
}