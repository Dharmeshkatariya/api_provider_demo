import 'package:get/get.dart';
import 'package:interview_practise/app/routes/app_pages.dart';
import 'package:interview_practise/helper/auth_helepr.dart';
import 'package:interview_practise/helper/user_helper.dart';

import '../../../../models/usermodel.dart';
import '../../../../utils/export.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  late PageController controller;
  RxInt selectedIndex = 0.obs;

  RxDouble pageValue = 0.0.obs;

  final authHelper = AuthHelper();

  setSession() async {
  }

  createPhoneVerification() async {
    await authHelper.createPhoneVerification();
  }

  RxBool isLoading = false.obs;

  Future<void> signUp() async {
    LoadingStore.setLoading();
    await authHelper
        .signUp(
      email: emailController.text,
      name: nameController.text,
      password: passController.text,
    )
        .then((res) {
      res.fold(
        (l) {
          LoadingStore.hideLoading();
          Toaster.showError(
            message: l,
          );
        },
        (r) async {
          UserModel userModel = UserModel(
            email: emailController.text,
            name: nameController.text,
            followers: [],
            following: [],
            profilePic: "",
            bannerPic: "",
            id: r.$id,
            bio: "",
          );
          await UserHelper().saveUserData(userModel).then(
            (user) {
              user.fold(
                (l) {
                  Toaster.showError(
                    message: l,
                  );
                  LoadingStore.hideLoading();

                },
                (r) {
                  LoadingStore.hideLoading();
                  Get.offAndToNamed(Routes.LOGIN);
                  Toaster.showSuccess(message: "Sign Up Success");

                },
              );
            },
          );
        },
      );
    });
  }

  Future<void> login() async {
    LoadingStore.setLoading();
    await authHelper
        .login(
            email: loginEmailController.text.trim(),
            password: loginPassController.text.trim())
        .then((res) {
      res.fold((l) {
        LoadingStore.hideLoading();
        Toaster.showError(message: l);

      }, (r) async {
        await  AppPreference.setLogin() ;
        LoadingStore.hideLoading();
        Get.offAllNamed(Routes.HOME);
        Toaster.showSuccess(message: "Login Success");

      });
    });
  }

  Future<void> logout() async {
    LoadingStore.setLoading();
    await authHelper.logout().whenComplete(() {
      LoadingStore.hideLoading();
      Get.offAllNamed(Routes.SIGNIN);
    });
  }

  @override
  void onInit() {
    selectedIndex.value = 0;
    pageValue.value = 0.0;
    controller =
        PageController(initialPage: selectedIndex.value, viewportFraction: 1.0)
          ..addListener(() {
            pageValue.value = controller.page!;
          });

    setSession();
    super.onInit();
  }



  @override
  void dispose() {
    emailController.clear();
    passController.clear();
    nameController.clear();
    loginEmailController.clear();
    loginPassController.clear();
    loginPassController.dispose();
    loginEmailController.dispose();
    emailController.dispose();
    passController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
