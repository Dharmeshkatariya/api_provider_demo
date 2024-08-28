
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../asset.dart';
import '../export.dart';

class CustomUploadImageCard extends StatefulWidget {
  const CustomUploadImageCard({super.key});

  @override
  State<CustomUploadImageCard> createState() => _CustomUploadImageCardState();
}

class _CustomUploadImageCardState extends State<CustomUploadImageCard> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        color: AppColors.lightText,
        strokeWidth: 2,
        dashPattern: const [8, 8],
        child: Container(
          height: 121.h,
          color: Colors.transparent,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  gallery,
                  width: 48.w, // Adjust as needed
                  height: 48.h, // Adjust as needed
                ),
                Text("Upload a file",
                    style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ));
  }
}
