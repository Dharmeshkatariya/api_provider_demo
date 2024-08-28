import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../app_colors.dart';
import '../export.dart';
import 'custom_checkbox.dart';

class CustomTaskCard extends StatefulWidget {
  final String title;
  final String time;
  final String dueDate;
  final String? status;
  final int imageCount;
  final String subTitle;
  final String? avatarUrl;
  final VoidCallback onTap;
  final bool showCircularContainer;

  const CustomTaskCard({
    super.key,
    required this.time,
    required this.title,
    required this.onTap,
    required this.dueDate,
    required this.subTitle,
    this.status,
    this.avatarUrl,
    this.imageCount = 3,
    this.showCircularContainer = true,
  });

  @override
  State<CustomTaskCard> createState() => _CustomTaskCardState();
}

class _CustomTaskCardState extends State<CustomTaskCard> {
  @override
  Widget build(BuildContext context) {
    Color cardColor;
    Color textColor;
    Color borderColor;
    Color dateTextColor;
    Color textTimeColor;
    bool isChecked = false;
    switch (widget.status) {
      case 'active':
        cardColor = AppColors.transparent;
        borderColor = AppColors.lightText;
        textColor = AppColors.primary;
        dateTextColor = AppColors.orange;
        textTimeColor = AppColors.black;
        break;
      case 'archived':
        cardColor = AppColors.lightGrey;
        borderColor = AppColors.lightGrey;
        textColor = AppColors.grey;
        dateTextColor = AppColors.grey;
        textTimeColor = AppColors.grey;
        break;
      case 'completed':
        isChecked = true;
        cardColor = AppColors.lightGrey;
        borderColor = AppColors.lightGrey;
        textColor = AppColors.grey;
        dateTextColor = AppColors.grey;
        textTimeColor = AppColors.grey;
        break;
      default:
        cardColor = AppColors.transparent;
        borderColor = AppColors.lightText;
        textColor = AppColors.grey;
        dateTextColor = AppColors.orange;
        textTimeColor = AppColors.black;
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: cardColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            children: [
              Row(
                children: [
                  if (widget.showCircularContainer)
                    CustomCheckbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                  if (widget.showCircularContainer) 16.horizontalSpace,
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text(
                    "#",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  6.horizontalSpace,
                  Flexible(
                    child: Text(
                      widget.subTitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: AppColors.grey,
                  ),
                  16.horizontalSpace,
                  Text(
                    widget.time,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: textTimeColor,
                    ),
                  ),
                ],
              ),
              5.verticalSpace,
              Padding(
                padding: EdgeInsets.only(right: 12.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: AppColors.grey,
                        ),
                        16.horizontalSpace,
                        Text(
                          widget.dueDate,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: dateTextColor,
                          ),
                        ),
                      ],
                    ),
                    CachedNetworkImage(
                      imageUrl: widget.avatarUrl ?? "",
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 18.r,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => CircleAvatar(
                        radius: 18.r,
                        child: const Icon(Icons.account_circle_outlined),
                      ),
                      errorWidget: (context, url, error) => CircleAvatar(
                        radius: 18.r,
                        child: const Icon(Icons.error),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
