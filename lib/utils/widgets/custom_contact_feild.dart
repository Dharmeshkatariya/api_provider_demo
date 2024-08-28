
import '../app_colors.dart';
import '../export.dart';

class CustomContactFeild extends StatefulWidget {
  const CustomContactFeild({super.key});

  @override
  State<CustomContactFeild> createState() => _CustomContactFeildState();
}

class _CustomContactFeildState extends State<CustomContactFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 55.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: AppColors.lightBorder,
          )),
      child: Text(
        "LocaleKeys.txt_choose_from_contacts.tr",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.black,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
