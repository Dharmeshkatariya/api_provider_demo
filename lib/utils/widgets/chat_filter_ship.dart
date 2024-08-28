// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
//
//
// class ChatFilterWidget extends StatelessWidget {
//   final Rx<ChatRoomType> selectedChatRoomType;
//   final void Function(ChatRoomType) onChipSelected;
//
//   const ChatFilterWidget({
//     super.key,
//     required this.selectedChatRoomType,
//     required this.onChipSelected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> choiceChips = [
//       {'title': "All", 'type': ChatRoomType.all},
//       {'title': "Unread", 'type': ChatRoomType.unread},
//       {'title': "Community", 'type': ChatRoomType.community},
//       {'title': "Task", 'type': ChatRoomType.task},
//     ];
//
//     return Obx(() {
//       return SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: choiceChips.map((chip) {
//             final isSelected = selectedChatRoomType.value == chip['type'];
//             return Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => onChipSelected(chip['type']),
//                   child: Chip(
//                     label: Text(chip['title']),
//                     shape: RoundedRectangleBorder(
//                       side: const BorderSide(color: AppColors.grey),
//                       borderRadius: BorderRadius.circular(45.r),
//                     ),
//                     labelStyle: TextStyle(
//                       fontSize: 16.sp,
//                       color: isSelected ? AppColors.white : AppColors.black,
//                     ),
//                     backgroundColor:
//                     isSelected ? AppColors.primary : AppColors.white,
//                   ),
//                 ),
//                 SizedBox(width: 10.w),
//               ],
//             );
//           }).toList(),
//         ),
//       );
//     });
//   }
// }
