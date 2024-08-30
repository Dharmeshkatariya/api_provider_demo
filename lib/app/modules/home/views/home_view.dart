import 'package:get/get.dart';
import 'package:interview_practise/app/routes/app_pages.dart';
import 'package:interview_practise/utils/export.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.CHAT) ;
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: const Icon(
                Icons.call_made,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
