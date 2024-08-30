import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview_practise/app/modules/splash/bindings/splash_binding.dart';
import 'package:interview_practise/services/appwrite_service.dart';
import 'package:interview_practise/utils/app_colors.dart';
import 'package:interview_practise/utils/app_theme.dart';
import 'api_providers/api_service.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppWriteServices(),permanent: true) ;
  await ScreenUtil.ensureScreenSize();
  API();
  await _setPreferredOrientations();
  runApp(const MyApp());
}

Future<void> _setPreferredOrientations() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Locale? locale = const Locale('en');

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () =>
              WidgetsBinding.instance.focusManager.primaryFocus!.unfocus(),
          child: GetMaterialApp(
            getPages: AppPages.routes,
            initialRoute: AppPages.INITIAL,
            locale: locale,
            transitionDuration: Durations.short4,
            defaultTransition: Transition.downToUp,
            // theme: ThemeData(
            //     useMaterial3: true,
            //     scaffoldBackgroundColor: AppColors.white,
            //     textTheme: GoogleFonts.poppinsTextTheme(),
            //     appBarTheme: const AppBarTheme(
            //       elevation: 0,
            //       centerTitle: true,
            //       scrolledUnderElevation: 0,
            //       shadowColor: Colors.transparent,
            //       backgroundColor: AppColors.white,
            //     ),
            //     elevatedButtonTheme: elevatedBtnTheme,
            //     colorScheme:
            //         ColorScheme.fromSeed(seedColor: AppColors.primary)),
            theme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            initialBinding: SplashBinding(),
            scrollBehavior: WebDragScrollBehavior(),
          ),
        );
      },
    );
  }

  ElevatedButtonThemeData get elevatedBtnTheme => ElevatedButtonThemeData(
        style: ButtonStyle(
          iconSize: const WidgetStatePropertyAll(24),
          fixedSize: WidgetStatePropertyAll(Size(context.width, 56)),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey.shade200;
            }
            return AppColors.primary;
          }),
          iconColor: WidgetStateProperty.resolveWith((states) {
            return Colors.white;
          }),
          shadowColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            return AppColors.primary;
          }),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return 0;
            }
            return 5;
          }),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
          textStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return GoogleFonts.poppins().copyWith(
                fontSize: 16.sp,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              );
            }
            return GoogleFonts.poppins().copyWith(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            );
          }),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
          ),
        ),
      );
}

class WebDragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
