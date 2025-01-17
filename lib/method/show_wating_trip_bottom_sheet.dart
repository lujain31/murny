import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/second_button.dart';

showWaitingTripBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 42,
                ),
                const Text(
                  "إنتظار 2 دقيقة",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff252C63)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const BookLocation(
                  locationFrom: "A2 كلية الصيدلة",
                  locationTo: "A3 كلية علوم الحاسب والمعلومات",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 22,
                ),
                SecondButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: "أبداء الرحلة",
                  color: Color(0xff252C63),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
