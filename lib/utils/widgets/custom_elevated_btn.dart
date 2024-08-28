
import 'package:get/get.dart';

import '../export.dart';

class CustomElevatedBtn extends StatefulWidget {
  final String? asset;
  final bool showIcon;
  final String buttonText;
  final void Function()? onPress;

  const CustomElevatedBtn({
    super.key,
    this.asset,
    this.onPress,
    this.showIcon = true,
    required this.buttonText,
  });

  @override
  State<CustomElevatedBtn> createState() => _CustomElevatedBtnState();
}

class _CustomElevatedBtnState extends State<CustomElevatedBtn> {
  WidgetStatesController controller = WidgetStatesController();

  @override
  void initState() {
    if (widget.onPress == null) controller.update(WidgetState.disabled, true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      statesController: controller,
      style: Get.theme.elevatedButtonTheme.style!.copyWith(),
      child: Row(
        mainAxisAlignment: controller.value.contains(WidgetState.disabled)
            ? widget.showIcon
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center
            : !widget.showIcon
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.buttonText,
            style: Get.theme.elevatedButtonTheme.style!.textStyle!
                .resolve(controller.value),
          ),
          if (widget.showIcon) ...{
            SvgPicture.asset(widget.asset!,
                color: controller.value.contains(WidgetState.disabled)
                    ? Colors.grey
                    : Colors.white)
          }
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CustomElevatedBtn oldWidget) {
    if (widget.onPress == null) {
      controller.update(WidgetState.disabled, true);
    } else {
      controller.update(WidgetState.disabled, false);
    }
    super.didUpdateWidget(oldWidget);
  }
}
