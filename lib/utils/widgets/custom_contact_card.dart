
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../asset.dart';
import '../export.dart';

class ContactItem extends StatelessWidget {
  final String name;
  final String number;
  final bool showBadges;
  final String? image;
  final void Function()? onTap;
  final void Function()? onShareTap;

  const ContactItem(
      {super.key,
      required this.name,
      required this.number,
      required this.showBadges,
      this.onTap,
      this.image,
      this.onShareTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 72.h,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      person, // Replace with your actual asset path
                      height: 44.5.h,
                      width: 44.5.w,
                    ),
                    if (showBadges)
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          width: 12.h,
                          height: 12.h,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 1.w, // Border width
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 10.w),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        number,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: AppColors.lightText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Badge(
              smallSize: 12.r,
              isLabelVisible: showBadges,
              backgroundColor: Colors.white,
              offset: const Offset(0, 4),
              label: Padding(
                padding: EdgeInsets.all(1.r),
                child: Container(
                    width: 10.r,
                    height: 10.r,
                    decoration: const BoxDecoration(
                        color: AppColors.orange, shape: BoxShape.circle)),
              ),
              child: GestureDetector(
                onTap: onShareTap,
                child: Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2.w,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      image ??
                          email, // Replace with your actual asset path
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactFilterList extends StatelessWidget {
  const ContactFilterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        // alignment: Alignment.center,
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: AppColors.lightBorder,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              person,
              height: 26.h,
              width: 26.w,
            ),
            8.horizontalSpace,
            Text(
              "Name",
              style: GoogleFonts.poppins(
                color: AppColors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            10.horizontalSpace,
            Icon(
              Icons.close,
              color: AppColors.primary,
              size: 24.sp,
            ),
            12.horizontalSpace,
            Image.asset(
              person,
              height: 26.h,
              width: 26.w,
            ),
            8.horizontalSpace,
            Text(
              "Name",
              style: GoogleFonts.poppins(
                color: AppColors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            10.horizontalSpace,
            Icon(
              Icons.close,
              color: AppColors.primary,
              size: 24.sp,
            ),
            const Spacer(),
          ],
        ));
  }
}
