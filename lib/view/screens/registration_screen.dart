import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meui_project/mixins/register_screen_mixin.dart';
import 'package:meui_project/repo/auth_repo.dart';
import 'package:meui_project/utils/default_snackbar_util.dart';
import 'package:meui_project/utils/gesturedetector_util.dart';
import 'package:meui_project/utils/internet_util.dart';
import 'package:meui_project/utils/size_config.dart';
import 'package:meui_project/utils/storage_manager.dart';
import 'package:meui_project/view/screens/nav_bar.dart';
import 'package:meui_project/view/widgets/common_button.dart';
import 'package:meui_project/view/widgets/progress_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with RegisterScreenMixin {
  final _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool passwordVisible2 = false;
  String firstName = "";
  String familyName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

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
                      "meui",
                      style: TextStyle(
                        color: const Color(0xff2d2b75),
                        fontWeight: FontWeight.w900,
                        fontSize: 5.h,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Sign Up With Your Email Address",
                      style: TextStyle(
                        color: const Color(0xff2d2b75),
                        fontWeight: FontWeight.w500,
                        fontSize: 2.5.h,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    _firstNameTextField(),
                    const SizedBox(height: 10),
                    _familyNameTextField(),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          // icon: Icon(Icons.person),
                          hintText: 'Enter Email',
                          labelText: 'Email Address',
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 14)),
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
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
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
                          labelStyle: const TextStyle(
                              color: Colors.grey, fontSize: 14)),
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
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 50, right: 50),
                    //   child: TextFormField(
                    //     obscureText: !passwordVisible2,
                    //     decoration: InputDecoration(
                    //         // icon: Icon(Icons.person),
                    //         suffixIcon: IconButton(
                    //           onPressed: () {
                    //             passwordVisible2 = !passwordVisible2;
                    //             setState(() {});
                    //           },
                    //           icon: passwordVisible2
                    //               ? const Icon(Icons.visibility_off)
                    //               : const Icon(Icons.visibility),
                    //         ),
                    //         hintText: 'Enter Confirm Password',
                    //         labelText: 'Confirm Password',
                    //         labelStyle:
                    //             const TextStyle(color: Colors.grey, fontSize: 14)),
                    //     onChanged: (String? value) {
                    //       confirmPassword = value!.trim();
                    //       setState(() {});
                    //     },
                    //     validator: (String? value) {
                    //       if (value!.trim().isEmpty) {
                    //         return "Enter Value";
                    //       } else if (value.trim() != password) {
                    //         return "Password does not match";
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                    const SizedBox(height: 50),
                    CommonButton(
                      title: "CREATE ACCOUNT",
                      onTap: () {
                        // Get.offAll(
                        //   const BottomNavigation(),
                        // );
                        _register();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _firstNameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
          // icon: Icon(Icons.person),
          hintText: 'Enter First Name',
          labelText: 'First Name',
          labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
      onChanged: (String? value) {
        firstName = value!.trim();
        setState(() {});
      },
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return "Enter First Name";
        }
        return null;
      },
    );
  }

  Widget _familyNameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
          // icon: Icon(Icons.person),
          hintText: 'Enter Family Name',
          labelText: 'Family Name',
          labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
      onChanged: (String? value) {
        familyName = value!.trim();
        setState(() {});
      },
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return "Enter Family Name";
        }
        return null;
      },
    );
  }

  void _register() async {
    FocusManager.instance.primaryFocus!.unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    await register(email, password);
  }
}
