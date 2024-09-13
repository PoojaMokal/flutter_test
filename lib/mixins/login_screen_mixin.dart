import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meui_project/repo/auth_repo.dart';
import 'package:meui_project/utils/default_snackbar_util.dart';
import 'package:meui_project/utils/internet_util.dart';
import 'package:meui_project/utils/storage_manager.dart';
import 'package:meui_project/view/screens/nav_bar.dart';
import 'package:meui_project/view/widgets/progress_dialog.dart';

mixin LoginScreenMixin {
  Future<void> login(String email, String password) async {
    ProgressDialog.showProgressDialog(Get.context!);

    final isInternet = await InternetUtil.isInternetConnected();

    if (isInternet) {
      try {
        Map payload = {
          'email': email.trim(),
          'password': password.trim(),
        };
        final result = await AuthRepo().loginUser(payload);
        Get.back();

        if (result.success == true) {
          _storeData(result.data!);

          Get.offAll(() => const BottomNavigation());
        } else {
          SnackBarUtil.showSnackBar(result.message!);
        }
      } catch (error) {
        Get.back();
        SnackBarUtil.showSnackBar('Something went wrong');
        debugPrint('error: $error');
      }
    } else {
      Get.back();
      SnackBarUtil.showSnackBar('No Internet Connected');
    }
  }

  void _storeData(Map data) {
    StorageManager().setData("user", data);
  }
}
