import 'package:bliu/screen/home_screen.dart';
import 'package:bliu/utils/permission_manager.dart';
import 'package:bliu/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  // KakaoSdk.init(
  //     nativeAppKey: 'e60ad4ca35937eabe4fbf3678e3720cc'
  // );

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //세로 모드 고정
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
    );
  }
}