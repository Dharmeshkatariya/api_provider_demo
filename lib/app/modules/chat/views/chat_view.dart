import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../helper/user_helper.dart';
import '../../../../models/usermodel.dart';
import '../../../../services/appwrite_service.dart';
import '../controllers/chat_controller.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {

  Rx<UserModel?> user = Rx<UserModel?>(null);
  final _chatController = Get.put(ChatController());

  late String _currentUserId;

  _getUser() async {
    await UserHelper().getUser(_currentUserId).then(
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
  void initState() {
    _currentUserId = AppWriteServices.loggedUid!;
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Group Chat App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _chatController.chatRoomTextController,
              decoration: const InputDecoration(labelText: 'Chat Room Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _chatController.createChatRoom(
                    currentUserModel: user.value!,
                    currentUserId: _currentUserId);
              },
              child: const Text('Create Chat Room'),
            ),
          ],
        ),
      ),
    );
  }
}
