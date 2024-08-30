import 'package:appwrite/appwrite.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:interview_practise/models/chat_room_model.dart';
import 'package:uuid/uuid.dart';
import '../constant/app_write_const.dart';
import '../constant/chat_room.dart';
import '../models/usermodel.dart';
import '../services/appwrite_service.dart';

class ChatHelper {
  final Databases db = AppWriteServices.appWriteDatabase;

  Future<Either<String, List<ChatRoomModel>>> getChatRooms() async {
    final userId = AppWriteServices.loggedUid;

    try {
      final response = await db.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.chatRoomsId,
        queries: [
          Query.equal(ChatRoomTable.userId, userId),
          Query.orderDesc(ChatRoomTable.createdAt),
        ],
      );

      if (response.documents.isNotEmpty) {
        var chatRooms = response.documents
            .map((doc) => ChatRoomModel.fromJson(doc.data))
            .toList();
        return Right(chatRooms);
      } else {
        return const Left('No chat rooms found');
      }
    } on AppwriteException catch (e) {
      return Left(e.message ?? 'An error occurred while fetching chat rooms');
    } catch (e) {
      print('Error fetching chat rooms: $e');
      return Left('An error occurred while fetching chat rooms');
    }
  }

  // Future<Either<String, List<ChatRoomModel>>> getChatRooms() async {
  //   try {
  //     final userId = AppWriteServices.loggedUid;
  //
  //     if (userId == null) {
  //       return const Left('User not authenticated');
  //     }
  //
  //     final response = await SupabaseService.client
  //         .from(TableName.chatRoom)
  //         .select('''
  //           id, name, created_at, user_id, chat_room_id, creator_id, typing_users
  //         ''')
  //         .contains(ChatRoomTable.userId, [userId])
  //         .order(ChatRoomTable.createdAt, ascending: false)
  //         .execute();
  //
  //     if (response.data is List) {
  //       var chatRooms = (response.data as List<dynamic>)
  //           .map((item) => ChatRoomModel.fromJson(item as Map<String, dynamic>))
  //           .toList();
  //       return Right(chatRooms);
  //     } else {
  //       return const Left('Unexpected response data type');
  //     }
  //   } catch (e) {
  //     print('Error fetching chat rooms: $e');
  //     return Left(e.toString());
  //   }
  // }

  Future<Either<String, ChatRoomModel>> createChatRoom(
    String name,
    List<String> userIds,
    String currentUserId,
    List<UserModel> userModels,
  ) async {
    try {
      var chatRoomId = const Uuid().v4();

      List<Map<String, dynamic>> typingUsersJson =
          userModels.map((user) => user.toMap()).toList();

      var data = {
        ChatRoomTable.name: name,
        ChatRoomTable.id: chatRoomId,
        ChatRoomTable.typingUsers: typingUsersJson,
        ChatRoomTable.chatRoomId: chatRoomId,
        ChatRoomTable.creatorId: currentUserId,
        ChatRoomTable.createdAt: DateTime.now().toIso8601String(),
        ChatRoomTable.joinedAt: DateTime.now().toIso8601String(),
        ChatRoomTable.userId: userIds,
      };

      final document = await db.createDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.chatRoomsId,
        documentId: chatRoomId,
        data: data,
      );

      return Right(ChatRoomModel.fromJson(document.data));
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, ChatRoomModel>> addParticipant(
    String chatRoomId,
    List<String> newUserIds,
    List<UserModel> newUserModelList,
  ) async {
    try {
      final document = await db.getDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.chatRoomsId,
        documentId: chatRoomId,
      );
      final currentParticipants =
          List<String>.from(document.data[ChatRoomTable.userId] ?? []);
      final currentTypingUsersJson = List<Map<String, dynamic>>.from(
          document.data[ChatRoomTable.typingUsers] ?? []);
      List<UserModel> currentTypingUsers = currentTypingUsersJson
          .map((json) => UserModel.fromMap(json))
          .toList();
      Set<String> updatedParticipantsSet = {
        ...currentParticipants,
        ...newUserIds
      };
      Set<UserModel> updatedTypingUsersSet = {
        ...currentTypingUsers,
        ...newUserModelList
      };
      List<String> updatedParticipants = updatedParticipantsSet.toList();
      List<Map<String, dynamic>> updatedTypingUsers =
          updatedTypingUsersSet.map((user) => user.toMap()).toList();
      var data = await db.updateDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.chatRoomsId,
        documentId: chatRoomId,
        data: {
          ChatRoomTable.userId: updatedParticipants,
          ChatRoomTable.typingUsers: updatedTypingUsers,
        },
      );
      return Right(ChatRoomModel.fromJson(data.data));
    } on AppwriteException catch (e) {
      return Left("Error updating participants: ${e.message}");
    } catch (e) {
      return const Left("Something went wrong while updating participants.");
    }
  }
}
