import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UpSideSigninSignup extends StatelessWidget {
  const UpSideSigninSignup({super.key, required this.visibleImage});
  final bool visibleImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                    Text(
                      'رجوع',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: visibleImage,
          child: Padding(
            padding: EdgeInsets.only(
              right: 63.sp,
            ),
            child: Image.asset(
              'assets/images/carMurny.png',
              alignment: Alignment.topRight,
              // colorFilter:
              //     const ColorFilter.mode(Colors.red, BlendMode.srcIn),
              width: 40.w,
            ),
          ),
        ),
      ],
    );
  }
}
