
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../export.dart';

class CustomSwitch extends StatelessWidget {
  final String label;
  final RxBool switchValue;
  final Function(bool) onChanged;

  const CustomSwitch({
    super.key,
    required this.label,
    required this.switchValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Obx(
          () => Switch(
            onChanged: onChanged,
            value: switchValue.value,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: AppColors.white,
            inactiveTrackColor: AppColors.lightText,
            trackOutlineWidth: const WidgetStatePropertyAll(0),
          ),
        ),
      ],
    );
  }
}
