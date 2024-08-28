
import 'package:get/get.dart';

import '../app_colors.dart';
import '../export.dart';

class CommonBackBtn extends StatelessWidget {
  final void Function()? onPress;
  const CommonBackBtn({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? () => Get.back(),
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
        child: ClipOval(
          child: ColoredBox(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
              child:
                  Icon(Icons.arrow_back, size: 17.r, color: AppColors.primary)),
        ),
      ),
    );
  }
}
