
import 'package:get/get.dart';

import '../app_colors.dart';
import '../export.dart';

class AuthIndicator extends StatefulWidget {
  final int index;
  const AuthIndicator({super.key, required this.index});

  @override
  State<AuthIndicator> createState() => _AuthIndicatorState();
}

class _AuthIndicatorState extends State<AuthIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 6.h),
        child: Row(
          children: [
            for (int i = 0; i <= 3; i++) ...{
              3.horizontalSpace,
              Expanded(
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: widget.index == i
                          ? AppColors.primary
                          : widget.index >= i
                              ? const Color(0xFF51DAA0)
                              : const Color(0xFFEDEDED)),
                ),
              ),
              3.horizontalSpace
            }
          ],
        ),
      ),
    );
  }
}
