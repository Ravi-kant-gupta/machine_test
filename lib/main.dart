import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/first%20screen/first_screen.dart';
import 'package:machine_test/login%20screen/login_screen.dart';

import 'home screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => FirstScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
