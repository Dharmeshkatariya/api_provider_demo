
import 'package:another_flushbar/flushbar.dart';
import 'package:get/get.dart';

import '../app_colors.dart';
import '../export.dart';

class Toaster {
  Toaster._();

  static Future showError({
    required String message,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) async {
    var context  = Get.context! ;
    await Flushbar(
      borderWidth: 1,
      messageText: Text(message,
          style: Get.textTheme.bodyLarge!.copyWith(
              color: AppColors.black,
              fontSize: 16.sp)),
      flushbarPosition: position,
      borderColor: AppColors.red,
      messageColor: AppColors.black,
      backgroundColor: AppColors.white,
      duration: const Duration(seconds: 5),
      flushbarStyle: FlushbarStyle.FLOATING,
      animationDuration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      icon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Container(
          width: 42.r,
          height: 42.r,
          decoration:
              const BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
          child: Icon(Icons.info_outline_rounded,
              color: AppColors.white, size: 24.r),
        ),
      ),
    ).show(context);
  }

  static Future showSuccess({
    required String message,

    FlushbarPosition position = FlushbarPosition.TOP,
  }) async {
    var context  = Get.context! ;

    await Flushbar(
      borderWidth: 1,
      messageText: Text(message,
          style: Get.textTheme.bodyLarge!.copyWith(
              color: AppColors.black,
              fontSize: 16.sp)),
      flushbarPosition: position,
      borderColor: Colors.green,
      messageColor: AppColors.black,
      backgroundColor: AppColors.white,
      duration: const Duration(seconds: 5),
      flushbarStyle: FlushbarStyle.FLOATING,
      animationDuration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      icon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Container(
          width: 42.r,
          height: 42.r,
          decoration:
              const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          child: Icon(Icons.done_outlined, color: AppColors.white, size: 24.r),
        ),
      ),
    ).show(context);
  }

  static Future showInfo({
    required String message,

    FlushbarPosition position = FlushbarPosition.TOP,
  }) async {
    var context  = Get.context! ;

    await Flushbar(
      messageText: Text(message,
          style: Get.textTheme.bodyLarge!.copyWith(
              color: AppColors.black,
              fontSize: 16.sp)),
      borderWidth: 1,
      flushbarPosition: position,
      messageColor: AppColors.black,
      backgroundColor: AppColors.white,
      duration: const Duration(seconds: 5),
      flushbarStyle: FlushbarStyle.FLOATING,
      animationDuration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(10),
      borderColor: Theme.of(context).colorScheme.primary,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      icon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Container(
          width: 42.r,
          height: 42.r,
          decoration: const BoxDecoration(
              color: AppColors.primary, shape: BoxShape.circle),
          child: Icon(Icons.info_outline_rounded,
              color: AppColors.white, size: 24.r),
        ),
      ),
    ).show(context);
  }
}
