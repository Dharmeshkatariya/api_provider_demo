
import '../app_colors.dart';
import '../export.dart';

class FilterChipWidget extends StatefulWidget {
  final List<Map<String, dynamic>> choiceChips;
  final Function(String selectedTitle)? onSelected;

  const FilterChipWidget(
      {super.key, required this.choiceChips, this.onSelected});

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  List<Map<String, dynamic>> _choiceChips = [];

  @override
  void initState() {
    _choiceChips =
        List.from(widget.choiceChips.map((e) => Map<String, dynamic>.from(e)));
    super.initState();
  }

  void _onChipTap(Map<String, dynamic> chipData) {
    final updatedChip = Map<String, dynamic>.from(chipData);
    updatedChip['selected'] = !updatedChip['selected'];

    for (var chip in _choiceChips) {
      chip['selected'] = chip == updatedChip;
    }
    setState(() {});
    if (widget.onSelected != null && updatedChip['selected']) {
      widget.onSelected!(updatedChip['title']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _choiceChips.map((chip) {
          return Row(
            children: [
              GestureDetector(
                onTap: () => _onChipTap(chip),
                child: Chip(
                  label: Text(chip['title']),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(45.r),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 16.sp,
                    color: chip['selected'] ? AppColors.white : AppColors.black,
                  ),
                  backgroundColor:
                      chip['selected'] ? AppColors.primary : AppColors.white,
                ),
              ),
              SizedBox(width: 10.w), // Replace 10.horizontalSpace
            ],
          );
        }).toList(),
      ),
    );
  }
}
