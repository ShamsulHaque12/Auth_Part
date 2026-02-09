import 'package:auth_part/auth_part/login_screen/screens/log_in_screen.dart';
import 'package:auth_part/auth_part/otp_screen/controller/otp_controller.dart';
import 'package:auth_part/core_data/custom_app_bar.dart';
import 'package:auth_part/core_data/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../core_data/custom_button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 45.w,
      height: 50.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.black),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/email.png",
                height: 70.h,
                width: 70.w,
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: CustomText(
                text: "Verify your email",
                fontSize: 24.sp,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Obx(() => CustomText(
                text: "We've sent a code to ${controller.email.value}. Enter it below to verify.",
                fontSize: 14.sp,
                color: Colors.grey,
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(height: 12.h,),
            /// 🔐 OTP PIN INPUT
            Center(
              child: Pinput(
                length: 6,
                controller: controller.pinController,
                keyboardType: TextInputType.number,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                ),
                onCompleted: (pin) {
                  debugPrint("OTP Completed: $pin");
                },
              ),
            ),

            SizedBox(height: 16.h),

            /// 🔁 Resend
            Center(
              child: Obx(
                    () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "Didn't receive the email?",fontSize: 14.sp,color: Colors.grey,),
                    GestureDetector(
                      onTap: controller.canResend.value
                          ? controller.resendCode
                          : null,
                      child: Text(
                        controller.canResend.value
                            ? "Resend code"
                            : "Resend code 00:${controller.seconds.value.toString().padLeft(2, '0')}",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),

            CustomButton(
              text: "Verify & Continue",
              onTap: () {
                Get.to(()=> LogInScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
