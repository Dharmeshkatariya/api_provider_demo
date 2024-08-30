import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:interview_practise/services/appwrite_service.dart';

import '../constant/app_write_const.dart';
import '../models/usermodel.dart';

class UserHelper {
  final Databases db = AppWriteServices.appWriteDatabase;

  Future<Either<String, Document>> saveUserData(UserModel userModel) async {
    try {
      final document = await db.createDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.usersCollectionId,
        documentId: userModel.id,
        data: userModel.toMap(),
      );

      return Right(document);
    } on AppwriteException catch (e, st) {
      print('AppwriteException: ${e.message}');
      print('StackTrace: $st');

      return Left(e.message ?? 'An unknown error occurred');
    } catch (e, st) {
      print('Exception: $e');
      print('StackTrace: $st');

      return Left(e.toString());
    }
  }


  Future<Either<String, UserModel>> getUser(String userId) async {
    try {
      final document = await db.getDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.usersCollectionId,
        documentId: userId,
      );
      var user = UserModel.fromMap(document.data);
      return Right(user);
    } catch (e) {
      return const Left("Something went wrong while fetching the user.");
    }
  }



  Future<Either<String, List<UserModel>>> getAllUsers() async {
    try {
      List<UserModel> users = [];
      bool hasMore = true;
      String? cursor;
      while (hasMore) {
        final response = await db.listDocuments(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.usersCollectionId,
        );
        final documents = response.documents;
        if (documents.isNotEmpty) {
          users.addAll(documents.map((doc) => UserModel.fromMap(doc.data)));
          cursor = response.total > documents.length ? documents.last.$id : null;
          hasMore = cursor != null;
        } else {
          hasMore = false;
        }
      }
      return Right(users);
    } on AppwriteException catch (e) {
      return Left("Error fetching users: ${e.message}");
    } catch (e) {
      return const Left("Something went wrong while fetching users.");
    }
  }


}
