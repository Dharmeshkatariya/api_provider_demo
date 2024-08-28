
import 'package:get/get.dart';

import '../app_colors.dart';
import '../export.dart';

class StrengthIndicator extends StatelessWidget {
  final int index;

  const StrengthIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 5.h,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Row(
          children: [
            for (int i = 0; i <= 9; i++) ...{
              Expanded(
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    borderRadius: i == 0
                        ? const BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            topLeft: Radius.circular(45))
                        : i == 9
                            ? const BorderRadius.only(
                                bottomRight: Radius.circular(45),
                                topRight: Radius.circular(45))
                            : BorderRadius.circular(0),
                    color: index >= i ? AppColors.green : AppColors.lightgray,
                  ),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
