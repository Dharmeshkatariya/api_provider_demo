import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:interview_practise/helper/auth_helepr.dart';
import 'package:interview_practise/utils/export.dart';
import '../constant/app_write_const.dart';

class AppWriteServices extends GetxService {
  static late Client appWriteClient;
  static late Account appWriteAccount;
  static late Databases appWriteDatabase;
  static late Storage appWriteStorage;
  static late Realtime appWriteRealtime;

  @override
  void onInit() {
    super.onInit();
    appWriteClient = Client()
        .setEndpoint(AppWriteConstants.endPoint)
        .setProject(AppWriteConstants.projectId)
        .setSelfSigned(status: true);
    appWriteAccount = Account(appWriteClient);
    appWriteDatabase = Databases(appWriteClient);
    appWriteStorage = Storage(appWriteClient);
    appWriteRealtime = Realtime(appWriteClient);

    getCurrentUserId();
  }

  static Rx<String?> currentUserId = Rx<String?>(null);

  bool get isAuthenticated {
    return currentUserId.value != null;
  }

  static String? get loggedUid => currentUserId.value;

  getCurrentUserId() async {
    var login = await AppPreference.getLogin();
    if (login) {
      currentUserId.value = await AuthHelper().getCurrentUserId();
    }
  }
}
