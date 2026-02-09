import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core_data/custom_button.dart';
import '../../../core_data/custom_text.dart';
import '../../../core_data/custom_text_field.dart';
import '../../sign_up_screen/screens/sign_up_screen.dart';
import '../controller/log_in_controller.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final LogInController controller = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Section
              Center(
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/5087/5087579.png",
                  height: 150.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16.h),

              // Title Section
              CustomText(
                text: "Welcome Back!",
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "Login to your existing account",
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              SizedBox(height: 16.h),

              // Email Field
              CustomText(text: "Email Address"),
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
              CustomText(text: "Password"),
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

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: CustomText(
                  text: "Forgot Password?",
                  onTap: () {},
                  fontSize: 13.sp,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10.h),
              CustomButton(text: "Log In", onTap: () {}),
              SizedBox(height: 16.h),
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: CustomText(
                      text: "Or continue with",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: 16.h),

              // Google Login Button
              CustomButton(
                text: "Sign in with Google",
                onTap: () {},
                backgroundColor: Colors.white,
                textColor: Colors.black87,
                borderColor: Colors.grey.shade300,
                borderWidth: 1,
                prefixIcon: Image.network(
                  "https://play-lh.googleusercontent.com/NN8G4Xc03GSv2_Tu-icuoeOwSo1xoZ4ouzUl24fVlwm5OeIAo7gV0zS1dVRWgCay-BU=w600-h300-pc0xffffff-pd",
                  height: 24.h,
                ),
              ),
              SizedBox(height: 16.h),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don't have an account?",
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: "Sign Up",
                    fontSize: 14.sp,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w400,
                    onTap: () {
                      Get.to(()=> SignUpScreen());
                    },
                  ),
                  SizedBox(height: 16.h,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
