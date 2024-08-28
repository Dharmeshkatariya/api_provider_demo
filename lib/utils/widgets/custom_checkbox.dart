
import '../export.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? Colors.grey : Colors.transparent,
          border: Border.all(color: Colors.grey, width: 1.5.w),
        ),
        child: value
            ? Center(
                child: Icon(
                  Icons.check,
                  size: 16.w,
                  color: Colors.white, // Color for the checkmark
                ),
              )
            : null,
      ),
    );
  }
}
