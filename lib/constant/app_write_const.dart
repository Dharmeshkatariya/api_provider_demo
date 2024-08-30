class AppWriteConstants {
  static const String databaseId = '66d1a054002fbf64009d';
  static const String projectId = '66d06ca3002138e4db46';

  static const String endPoint = 'https://cloud.appwrite.io/v1';
  static const String apiKeySecret = 'e5c155227540e77dd8d9f2ee2468cfb1dafc732c5bfe51783a06c94e29ce9eea833b802df34f49b7da729ed30ae0839bd07ffbcf0882888b798601635de5a487475940d135e3f829cbaa9769481ebb843e676f112c6cb6fd30ee05f4c6cf7ff557dc690e6fa521088122583a4f5f13923a00a4fad7daed8b7c5c8f6d511d4b2a';
  // static const String usersCollection = 'users';
  static const String usersCollectionId = '66d1a08600257c003e8a';
  static const String chatRoomsId = '66d1b00a001f1c378019';
  static const String chatRoomsMessagesId = '66d1b0550019693b9cc5';
  static const String tweetsCollection = '';
  static const String notificationsCollection = '';

  static const String imagesBucket = '';
  static const String images = 'https://images.unsplash.com/photo-1704168370831-b7f450dadeb0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHx8';


  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
