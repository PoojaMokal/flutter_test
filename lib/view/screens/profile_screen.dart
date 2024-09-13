import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meui_project/app_constants/constants.dart';
import 'package:meui_project/utils/size_config.dart';
import 'package:meui_project/utils/storage_manager.dart';
import 'package:meui_project/view/screens/login_screen.dart';
import 'package:meui_project/view/widgets/common_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "meui",
          style: TextStyle(
            color: const Color(0xff2d2b75),
            fontWeight: FontWeight.w900,
            fontSize: 5.h,
          ),
        ),
        elevation: 0.7,
      ),
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Profile",
              style: TextStyle(
                color: const Color(0xff2d2b75),
                fontWeight: FontWeight.w500,
                fontSize: 3.h,
              ),
            ),
            SizedBox(height: 10.w),
            _commonContainer(title: "First Name", value: "John"),
            SizedBox(height: 6.w),
            _commonContainer(title: "Family Name", value: "Doe"),
            SizedBox(height: 6.w),
            _commonContainer(title: "Email", value: "johndoe@gmail.com"),
            SizedBox(height: 10.w),
            CommonButton(
              title: "UPDATE MY ACCOUNT",
              onTap: () {},
            ),
            SizedBox(height: 6.w),
            CommonButton(
              title: "LOGOUT",
              onTap: () {
                StorageManager().eraseStorage();
                Get.offAll(const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _commonContainer({required String title, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
      width: 100.w,
      decoration: BoxDecoration(
        color: Constants.grey,
        border: Border(
          left: BorderSide(
            color: Constants.primaryColor,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff2d2b75),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xff2d2b75),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
