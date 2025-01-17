import 'package:flutter/material.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';
import 'package:murny_final_project/screens/success/success.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/cart_detil.dart';
import 'package:murny_final_project/widgets/custom_divider.dart';
import 'package:murny_final_project/widgets/driver_info.dart';
import 'package:murny_final_project/widgets/payment_method.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:murny_final_project/widgets/trip_detil.dart';

showAcceptOrderBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 20),
                child: const Text(
                  "عربتك في الطريق إليك",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              const TripDetil(
                tripStartTime: "9:42AM",
                destinationArrivalTime: "10:30AM",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              const Row(
                children: [
                  DriverInfo(
                    driverImage: "assets/images/driver_profile.png",
                    driverName: "عبدالرحمن حاتم",
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 62,
              ),
              CustomDivider(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 82,
              ),
              const BookLocation(
                locationFrom: "كلية الصيدلة A2",
                locationTo: "كلية علوم الحاسب والمعلومات A3",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 82,
              ),
              CustomDivider(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 140,
              ),
              const CartDetil(
                numberOfCartSeat: "عربة جولف 4 مقاعد",
              ),
              const Divider(
                color: Color(0xffF4F4F4),
              ),
              PaymentMethod(paymentMethod: "نقداً"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 140,
              ),
              CustomDivider(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 82,
              ),
              Center(
                child: SecondButton(
                  title: "إلغاء الطلب",
                  onPressed: () {
                    showConfirmDiolg(
                        context: context,
                        title: 'هل أنت متأكد انك تريد الغاء الطلب',
                        acceptFun: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const SuccessScreen(
                                        message: "تم إلغاء طلبك بنجاح",
                                      )),
                              (Route route) => false);
                        });
                  },
                  color: const Color(0xffF21D53),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
