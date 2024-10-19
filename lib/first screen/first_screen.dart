import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:machine_test/first%20screen/first_screen_controller.dart';

import '../login screen/login_screen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final controller = Get.put(FirstController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                transform: GradientRotation(10),
                colors: [Colors.purple, Color.fromARGB(255, 1, 251, 251)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            const SafeArea(
                child: Icon(
              FontAwesomeIcons.microphoneLines,
              color: Colors.white,
              size: 100,
            )),
            SizedBox(
              height: Get.height * 0.05,
            ),
            const Text(
              "Welcome to",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("MUSIC",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    textScaleFactor: 2),
                Text("APP",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    textScaleFactor: 2),
              ],
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            SizedBox(
              width: Get.width * 0.35,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text("Log in", style: TextStyle(fontSize: 18))),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Register", style: TextStyle(fontSize: 18))),
            ),
            SizedBox(height: Get.height * 0.07),
            SizedBox(
                width: Get.width * 0.29,
                child: RichText(
                    text: TextSpan(
                        text: "Or quick Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        children: [TextSpan(text: " with Touch ID")]))),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Icon(
              Icons.fingerprint,
              color: Colors.white,
              size: 70,
            )
          ],
        ),
      ),
    );
  }
}
