import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core_data/custom_app_bar.dart';
import '../../../core_data/custom_button.dart';
import '../../../core_data/custom_text.dart';
import '../../../core_data/custom_text_field.dart';
import '../../login_screen/screens/log_in_screen.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  // Controller Injection
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: "Create Account",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "Fill in your details to get started",
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              // Name Field
              const CustomText(text: "Full Name"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.nameController,
                hintText: "Enter your name",
                fillColor: Colors.grey.shade100,
                textColor: Colors.black,
                suffixIcon: const Icon(Icons.person_outline, size: 20),
              ),
              SizedBox(height: 8.h),

              // Email Field
              const CustomText(text: "Email Address"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.emailController,
                hintText: "example@gmail.com",
                fillColor: Colors.grey.shade100,
                textColor: Colors.black,
                suffixIcon: const Icon(Icons.email_outlined, size: 20),
              ),
              SizedBox(height: 8.h),

              // Password Field
              const CustomText(text: "Password"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.passwordController,
                hintText: "••••••••",
                fillColor: Colors.grey.shade100,
                textColor: Colors.black,
                suffixIcon: const Icon(Icons.lock_outline, size: 20),
                isPassword: true,
              ),
              SizedBox(height: 8.h),

              // Confirm Password Field
              const CustomText(text: "Confirm Password"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: controller.confirmPasswordController,
                hintText: "••••••••",
                fillColor: Colors.grey.shade100,
                textColor: Colors.black,
                suffixIcon: const Icon(Icons.lock_reset_outlined, size: 20),
                isPassword: true,
              ),

              SizedBox(height: 16.h),

              // Sign Up Button
              CustomButton(
                  text: "Sign Up",
                  onTap: () {

                  }
              ),

              SizedBox(height: 12.h),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: CustomText(
                      text: "Or continue with",
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),

              SizedBox(height: 12.h),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an account?",
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () => Get.to(() => LogInScreen()),
                    child: CustomText(
                      text: "Log In",
                      fontSize: 14.sp,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}