

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview_practise/utils/asset.dart';

import '../app_colors.dart';
import '../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? iconAsset;
  final void Function()? onTap;
  final bool showIcon;
  final bool showTitle;
  const CustomAppBar({
    super.key,
    this.title,
    this.iconAsset,
    this.onTap,
    this.showIcon = true,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      leading: showIcon
          ? Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: GestureDetector(
                onTap: onTap ?? () => Get.back(),
                child: Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: const BoxDecoration(
                    color: AppColors.lightBorder,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconAsset ?? left,
                      width: 18.w,
                      height: 17.h,
                    ),
                  ),
                ),
              ),
            )
          : null,
      title: showTitle
          ? Text(
              title ?? '',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
