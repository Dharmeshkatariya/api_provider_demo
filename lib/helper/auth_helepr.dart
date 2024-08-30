import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:interview_practise/services/appwrite_service.dart';
import '../../../../utils/export.dart';

class AuthHelper {
  final Account _account = AppWriteServices.appWriteAccount;

  Future<Either<String, User>> getUser() async {
    try {

      return Right(await _account.get());
    } catch (e) {
      print('Error getting user: $e');
      return Left(e.toString());
    }
  }

  Future<String> getCurrentUserId() async {
      final user = await _account.get();
      return user.$id;
  }
  Future<Either<String, Session>> createAnonymousSession() async {
    try {
      return Right(await _account.createAnonymousSession());
    } catch (e) {
      print('Error creating anonymous session: $e');
      return Left(e.toString());
    }
  }

  Future<Either<String, User>> updateEmail({
    required String email,
    required String password,
  }) async {
    try {
      return Right(
          await _account.updateEmail(email: email, password: password));
    } catch (e) {
      print('Error updating email: $e');
      return Left(e.toString());
    }
  }
  Future<Either<String, User>> updateName({required String name}) async {
    try {
      return Right(await _account.updateName(name: name));
    } catch (e) {
      print('Error updating name: $e');
      return Left(e.toString());
    }
  }

  // Future<Either<String, User>> phoneVerification(String userId, String phone) async {
  //   try {
  //     await _account.createPhoneSession(userId: userId, phone: phone);
  //     return true;
  //   } catch (e) {
  //     print('Error verifying phone: $e');
  //     return false;
  //   }
  // }

  Future<Either<String, bool>> setSession() async {
    try {
      var data = await _account.getSession(sessionId: 'current');
      if (data.current) {
        var user = await _account.get();
        if(user != null){
          return Right(true);
        }else{
          return Right(false);

        }

      } else {
        return const Left("sessign error");
      }
    } catch (e) {
      print('Error setting session: $e');
      return Left(e.toString());
    }
  }

  Future<Either<String, Token>> createPhoneVerification() async {
    try {
      return Right(await _account.createPhoneVerification());
    } catch (e) {
      print('Error creating phone verification: $e');
      return Left(e.toString());
    }
  }

  Future<Either<String, User>> signUp(
      {required String email,
      required String name,
      required String password}) async {
    try {
      return Right(await _account.create(
        userId: ID.unique(),
        email: email,
        name: name,
        password: password,
      ));
    } catch (e) {
      print('Error _account creating $e');
      return Left(e.toString());
    }
  }

  Future<Either<String, Session>> login({
    required String email,
    required String password,
  }) async {
    try {
      return Right(await _account.createEmailPasswordSession(
        email: email.trim(),
        password: password.trim(),
      ));
    } catch (e) {
      print('Error login creating $e');
      return Left(e.toString());
    }
  }

  Future<void> logout() async {
    await _account.deleteSession(sessionId: 'current');
  }


// Future<void> signInWithApple() async {
//   try {
//     final credential = await AppleSignIn.performRequests([
//       AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
//     ]);
//
//     final oAuthProvider = OAuthProvider('apple.com');
//     final credentialToken = String.fromCharCodes(credential.identityToken!);
//     final AuthCredential authCredential =
//     oAuthProvider.credential(idToken: credentialToken);
//
//     // Sign in with Firebase using Apple Auth credentials
//     await FirebaseAuth.instance.signInWithCredential(authCredential);
//
//     // Use the Apple user ID token to sign in with Appwrite
//     await authHelper.createOAuth2Session(
//       provider: 'apple',
//       accessToken: credentialToken,
//     );
//   } catch (error) {
//     print("Error signing in with Apple: $error");
//   }
// }
// Future<UserCredential?> signInWithGoogle() async {
//   try {
//     // Initialize GoogleSignIn
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     if (googleUser == null) {
//       // User cancelled the sign-in process
//       return null;
//     }
//
//     // Get GoogleSignInAuthentication
//     final GoogleSignInAuthentication googleAuth =
//     await googleUser.authentication;
//
//     // Create GoogleAuthProvider credential
//     final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     // Sign in with Firebase using Google Auth credentials
//     final UserCredential userCredential =
//     await FirebaseAuth.instance.signInWithCredential(credential);
//
//     // Use the Firebase user ID token to sign in with Appwrite
//     await authHelper.createOAuth2Session(
//       provider: 'google',
//       accessToken: googleAuth.accessToken,
//     );
//
//     return userCredential;
//   } catch (e) {
//     print("Error signing in with Google: $e");
//     return null;
//   }
// }
}
