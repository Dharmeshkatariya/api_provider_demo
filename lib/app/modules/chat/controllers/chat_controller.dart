import 'package:get/get.dart';
import 'package:interview_practise/helper/chat_helper.dart';
import 'package:interview_practise/services/appwrite_service.dart';

import '../../../../helper/user_helper.dart';
import '../../../../models/usermodel.dart';
import '../../../../utils/export.dart';
import '../views/add_participants.dart';
import '../views/chat_room_list.dart';

class ChatController extends GetxController {
  RxString currentUserId = "".obs;
  late ScrollController scrollController = ScrollController();
  final focusNode = FocusNode();

  var unreadMessagesAtTheBottom = false.obs;

  final disposed = false.obs;

  // void scrollToBottom(List<Message> messages) {
  //   for (int i = 0; i <= messages.length; i++) {
  //     Future.delayed(Duration(milliseconds: i * 50), () {
  //       if (scrollController.hasClients) {
  //         scrollController.jumpTo(scrollController.position.minScrollExtent);
  //       }
  //     });
  //   }
  // }

  //// chat room creating all code

  final TextEditingController chatRoomTextController = TextEditingController();
  final chatHelper = ChatHelper();

  String? get loggedUid => AppWriteServices.loggedUid;
  Rx<UserModel?> user = Rx<UserModel?>(null);

  Future<void> createChatRoom(
      {required String currentUserId,
      required UserModel currentUserModel}) async {
    final name = chatRoomTextController.text;
    if (name.isNotEmpty) {
      await chatHelper
          .createChatRoom(
              name, [currentUserId], currentUserId, [currentUserModel])
          .then(
        (res) {
          res.fold(
            (l) {
              Toaster.showError(message: l);
            },
            (chat) {
              if (chat.chat_room_id.isNotEmpty) {
                Get.to(
                  AddParticipatesView(
                    chatRoomId: chat.chat_room_id,
                  ),
                );
                chatRoomTextController.clear();
              }
            },
          );
        },
      );
    }
  }

  RxBool addParticipateLoading = false.obs;

  Future<void> addParticipants({
    required String chatRoomId,
    required List<String> selectedUserId,
    required List<UserModel> selectedUserModel,
  }) async {
    addParticipateLoading.value = true;
    try {
      final response = await chatHelper.addParticipant(
          chatRoomId, selectedUserId, selectedUserModel);
      response.fold(
        (error) {
          Toaster.showError(message: error);
        },
        (_) {
          addParticipateLoading.value = false;
          Toaster.showSuccess(message: "Participant added successfully!");
          Get.off(() => const ChatRoomListPage());
        },
      );
    } catch (e) {
      Toaster.showError(message: "Something went wrong: $e");
    }
  }

  _getUser() async {
    await UserHelper().getUser(AppWriteServices.loggedUid!).then(
      (res) {
        res.fold(
          (l) {},
          (r) {
            user.value = r;
          },
        );
      },
    );
  }

  @override
  void onInit() {
    _getUser();
    super.onInit();
  }
}
