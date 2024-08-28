
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../export.dart';

class CustomSearchBar extends StatelessWidget {
  final double? height;
  final double? width;
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final  Function(String)? onSubmitted;

  const CustomSearchBar({
    super.key,
    this.height,
    this.width,
    this.hintText = 'Search',
    this.controller,
    this.onChanged,
    this.textInputAction = TextInputAction.search,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      width: width ?? 361.w,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: AppColors.lightText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBorder, width: 1.5.w),
            borderRadius: BorderRadius.circular(15.0.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBorder, width: 1.5.w),
            borderRadius: BorderRadius.circular(15.0.r),
          ),
          prefixIcon: Icon(
            Icons.search, // Replace this with your desired icon
            color: AppColors.black,
            size: 24.0.sp,
          ),
          focusColor: AppColors.lightBorder,
        ),
      ),
    );
  }
}
