import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murny_final_project/widgets/account_text.dart';
import 'package:murny_final_project/widgets/button_gmail_apple.dart';
import 'package:murny_final_project/widgets/divider_signin_signup.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/text_field.dart';
import 'package:murny_final_project/widgets/up_side_signin_siginup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController conName = TextEditingController();
TextEditingController conPhone = TextEditingController();
TextEditingController conEmail = TextEditingController();
TextEditingController conPass = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: const Color(0xffFFFFFF),
            body: Padding(
                padding: EdgeInsets.all(20.sp),
                child: SingleChildScrollView(
                  child: Column(children: [
                    const UpSideSigninSignup(
                      visibleImage: true,
                    ),
                    const Align(
                        alignment: Alignment.topRight,
                        child: Text('إنشاء حساب',
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xff252C63),
                            ))),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFieldWidget(
                      text: 'الإسم الثلاثي',
                      typeKeyboard: TextInputType.name,
                      scure: false,
                      visiblePhone: false,
                      controller: conName,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFieldWidget(
                      text: 'ادخل رقم جوالك',
                      typeKeyboard: TextInputType.phone,
                      scure: false,
                      visiblePhone: true,
                      controller: conPhone,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFieldWidget(
                      text: 'ادخل ايميلك',
                      typeKeyboard: TextInputType.emailAddress,
                      scure: false,
                      visiblePhone: false,
                      controller: conEmail,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFieldWidget(
                      text: 'ادخل كلمة المرور',
                      typeKeyboard: TextInputType.visiblePassword,
                      scure: true,
                      visiblePhone: false,
                      controller: conPass,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          activeColor: const Color(0xff252C63),
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                              print("Button value: $value");
                            });
                          },
                        ),
                        const Text(
                          'بالإشتراك أنت توافق على شروط الخدمة وسياسة الخصوصية.',
                          textDirection: TextDirection.rtl,
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                        child: PrimaryButton(
                      isText: true,
                      title: "اشتراك",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                    )),
                    SizedBox(
                      height: 1.h,
                    ),
                    const DividerSigninSignup(),
                    SizedBox(
                      height: 1.h,
                    ),
                    PrimaryButton(
                      onPressed: () {},
                      isText: false,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    PrimaryButton(
                      onPressed: () {},
                      isText: false,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const AccountText(
                      firstText: 'تسجيل الدخول',
                      secondText: 'هل لديك حساب؟',
                    ),
                  ]),
                ))));
  }
}
