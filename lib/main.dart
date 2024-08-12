import 'package:bliu/screen/login_join/login_screen.dart';
import 'package:bliu/screen/main_page.dart';
import 'package:bliu/screen/on_boarding_screen.dart';
import 'package:bliu/utils/permission_manager.dart';
import 'package:bliu/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // 세로 모드 고정
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Utils.getInstance();
  await PermissionManager().requestPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // OnBoardingScreen을 초기 화면으로 설정
    );
  }
}
