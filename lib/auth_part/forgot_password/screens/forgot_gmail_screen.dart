import 'package:auth_part/auth_part/forgot_password/controller/forgot_password_controller.dart';
import 'package:auth_part/core_data/custom_app_bar.dart';
import 'package:auth_part/core_data/custom_button.dart';
import 'package:auth_part/core_data/custom_text.dart';
import 'package:auth_part/core_data/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'forgot_gmail_otp_screen.dart';

class ForgotGmailScreen extends StatelessWidget {
  ForgotGmailScreen({super.key});
  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CustomText(text: "Forgot Password", fontSize: 24)),
            SizedBox(height: 8.h),
            Center(
              child: CustomText(
                text:
                    "Enter your registered email address. We’ll send a 6-digit verification code to reset your password.",
                textAlign: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 22.h,),
            CustomText(text: "Email Address"),
            SizedBox(height: 8.h),
            CustomTextField(
              textEditingController: controller.emailController,
              hintText: "example@gmail.com",
              fillColor: Colors.grey.shade100,
              textColor: Colors.black,
              suffixIcon: const Icon(Icons.email_outlined, size: 20),
            ),
            SizedBox(height: 24.h),
            CustomButton(text: "Continue", onTap: () {
              Get.to(()=> ForgotGmailOtpScreen(),arguments: controller.emailController.text);
            }),

          ],
        ),
      ),
    );
  }
}
