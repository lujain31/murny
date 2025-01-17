import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/balance/balance_home.dart';
import 'package:murny_final_project/widgets/second_button.dart';

showSuccessAddBalanceDiolg(
    {required BuildContext context, required String balance}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 200),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close)),
              ),
              Image.asset("assets/images/success_blue.png"),
              SizedBox(height: MediaQuery.of(context).size.height / 62),
              const Text(
                "إضافة ناجحة",
                style: TextStyle(fontSize: 22),
              ),
              const Text(
                "تمت إضافة مبلغك بنجاح",
                style: TextStyle(color: Color(0xff898989), fontSize: 12),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 62),
              const Text(
                "الكمية",
                style: TextStyle(color: Color(0xff5A5A5A)),
              ),
              Text(
                balance,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 32),
              SecondButton(
                  title: "الرجوع",
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => HomeBalanceScreen()),
                        (Route route) => false);
                  },
                  color: const Color(0xff252C63))
            ],
          ),
        ),
      ),
    ),
  );
}
