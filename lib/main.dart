import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homeworkout_flutter/Bindings/binding.dart';
import 'package:homeworkout_flutter/View/home.dart';
import 'package:homeworkout_flutter/View/login.dart';
import 'package:homeworkout_flutter/View/signup..dart';
import 'package:homeworkout_flutter/View/signup_step3.dart';
import 'package:homeworkout_flutter/View/signup_step4.dart';
import 'package:homeworkout_flutter/View/startupscreen.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget  {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _Myapp();
}

class _Myapp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  theme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
  ),
      initialBinding: Binding(),
        initialRoute: '/',
        routes: {
 '/': (context) => StartupScreen(),
"/home": (context)=> Home(),
"/login":(context)=>LogIn(),
"/signup_step1":(context)=>SignUp(),
"/signup_step3":(context)=>SignupStep3(),
"/signup_step4":(context)=>SignupStep4(),
  }
            );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}