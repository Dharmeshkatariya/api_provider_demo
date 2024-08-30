import 'dart:async';

import 'package:get/get.dart';
import 'package:googleapis/admob/v1.dart';
import 'package:interview_practise/app/routes/app_pages.dart';
import 'package:interview_practise/helper/auth_helepr.dart';
import 'package:interview_practise/utils/export.dart';

class SplashController extends GetxController {
  getCurrentUser() async {
    var login = await AppPreference.getLogin();

    Timer(const Duration(seconds: 3), () {
      if (login == true) {
        Get.toNamed(Routes.HOME);
        return;
      } else {
        Get.toNamed(Routes.SIGNIN);
        return;
      }
    });
  }

  @override
  void onInit() {
    // getCurrentUser();
    super.onInit();
  }
}
