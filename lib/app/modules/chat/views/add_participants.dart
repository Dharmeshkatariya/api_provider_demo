import 'package:get/get.dart';
import 'package:interview_practise/app/modules/chat/controllers/chat_controller.dart';
import 'package:interview_practise/helper/user_helper.dart';
import '../../../../models/usermodel.dart';
import '../../../../utils/export.dart';

class AddParticipatesView extends StatefulWidget {
  final String chatRoomId;

  const AddParticipatesView({super.key, required this.chatRoomId});

  @override
  State<AddParticipatesView> createState() => _AddParticipatesViewState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('chatRoomId', chatRoomId));
  }
}

class _AddParticipatesViewState extends State<AddParticipatesView> {
  List<UserModel> _users = [];
  bool _isLoading = true;
  String? _error;
  final List<String> _selectedUsers = [];
  final List<UserModel> _selectedUsersModel = [];

  @override
  void initState() {
    _fetchUsers();
    super.initState();
  }

  Future<void> _fetchUsers() async {
    final result = await UserHelper().getAllUsers();
    result.fold(
      (error) {
        setState(() {
          _error = error;
          _isLoading = false;
        });
      },
      (users) {
        setState(() {
          _users = users;
          _isLoading = false;
        });
      },
    );
  }

  final _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Participants'),
        actions: [
          Obx(() {
            return TextButton(
              onPressed: () {
                _chatController.addParticipants(
                    chatRoomId: widget.chatRoomId,
                    selectedUserId: _selectedUsers,
                    selectedUserModel: _selectedUsersModel);
              },
              child: _chatController.addParticipateLoading.value
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const Text('Add Selected',
                      style: TextStyle(color: Colors.white)),
            );
          })
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text('Error: $_error'))
              : ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return ListTile(
                      title: Text(user.name ?? 'No Name'),
                      subtitle: Text(user.email ?? 'No Email'),
                      trailing: IconButton(
                        icon: Icon(
                          _selectedUsers.contains(user.id)
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: _selectedUsers.contains(user.id)
                              ? Colors.blue
                              : null,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_selectedUsers.contains(user.id)) {
                              _selectedUsers.remove(user.id);
                              _selectedUsersModel.remove(user);
                            } else {
                              _selectedUsers.add(user.id!);
                              _selectedUsersModel.add(user);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
