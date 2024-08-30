import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:interview_practise/app/routes/app_pages.dart';
import 'package:interview_practise/helper/chat_helper.dart';
import '../../../../models/chat_room_model.dart';
import '../../../../utils/app_colors.dart';
import '../controllers/chat_controller.dart';

class ChatRoomListPage extends StatefulWidget {
  const ChatRoomListPage({super.key});

  @override
  _ChatRoomListPageState createState() => _ChatRoomListPageState();
}

class _ChatRoomListPageState extends State<ChatRoomListPage> {

  RxBool loading = false.obs;
  List<ChatRoomModel> _chatRoomsFuture = [];

  final controller = Get.put(ChatController());

  @override
  void initState() {
    loading.value = true;
    super.initState();
    getData() ;

  }

  getData() async {
    await ChatHelper().getChatRooms().then(
          (res) {
        res.fold(
              (l) {
            loading.value = false;
          },
              (r) {
            _chatRoomsFuture = r;
            loading.value = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text('Chat Rooms'),
        actions: [
          GestureDetector(
            onTap: () async {
              Get.toNamed(Routes.CHAT);
            },
            child: Padding(
                padding: EdgeInsets.only(right: 20.sp),
                child: const Icon(Icons.add)),
          ),
        ],
      ),
      body: Obx(
        () {
          return loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: ListView.builder(
                    itemCount: _chatRoomsFuture.length,
                    itemBuilder: (context, index) {
                      final chatRoom = _chatRoomsFuture[index];
                      return GestureDetector(
                        onTap: () {
                          // Get.to(ChatScreen(
                          //     chatRoomId: chatRoom.id,
                          //     groupName: chatRoom.name,
                          //     chatRoom: chatRoom));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 1.sp),
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.sp, vertical: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                chatRoom.name,
                                style: const TextStyle(
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                "Joined User : ${chatRoom.userIds.length.toString()}",
                                style: const TextStyle(
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
