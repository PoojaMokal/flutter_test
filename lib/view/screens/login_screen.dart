import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meui_project/mixins/login_screen_mixin.dart';
import 'package:meui_project/repo/auth_repo.dart';
import 'package:meui_project/utils/default_snackbar_util.dart';
import 'package:meui_project/utils/gesturedetector_util.dart';
import 'package:meui_project/utils/internet_util.dart';
import 'package:meui_project/utils/size_config.dart';
import 'package:meui_project/view/screens/nav_bar.dart';
import 'package:meui_project/view/screens/registration_screen.dart';
import 'package:meui_project/view/widgets/common_button.dart';
import 'package:meui_project/view/widgets/progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginScreenMixin {
  bool passwordVisible = false;
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GestureDetectorUtil.onScreenTap();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To",
                      style: TextStyle(
                        color: const Color(0xff2d2b75),
                        fontWeight: FontWeight.w500,
                        fontSize: 3.h,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "meui",
                      style: TextStyle(
                        color: const Color(0xff2d2b75),
                        fontWeight: FontWeight.w900,
                        fontSize: 5.h,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    _emailTextField(),
                    const SizedBox(height: 10),
                    _passwordTextField(),
                    const SizedBox(height: 50),
                    CommonButton(
                      title: "LOGIN",
                      onTap: () {
                        Get.offAll(
                          const BottomNavigation(),
                        );
                        // _login();
                      },
                    ),
                    SizedBox(height: 2.h),
                    _registerButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Get.to(() => const RegisterScreen());
          },
          child: const Text(
            'Create new account',
            textAlign: TextAlign.left,
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: !passwordVisible,
      decoration: InputDecoration(
          // icon: Icon(Icons.person),
          suffixIcon: IconButton(
            onPressed: () {
              passwordVisible = !passwordVisible;
              setState(() {});
            },
            icon: passwordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          hintText: 'Enter Password',
          labelText: 'Password',
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14)),
      onChanged: (String? value) {
        password = value!.trim();
        setState(() {});
      },
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return "Enter Value";
        }
        return null;
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(
          // icon: Icon(Icons.person),
          hintText: 'Enter Email',
          labelText: 'Email Address',
          labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
      onChanged: (String? value) {
        email = value!.trim();
        setState(() {});
      },
      validator: (String? value) {
        final bool isValid = EmailValidator.validate(value!);

        if (!isValid) {
          return "Enter valid email";
        }
        return null;
      },
    );
  }

  void _login() async {
    FocusManager.instance.primaryFocus!.unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    await login(email, password);
  }
}
