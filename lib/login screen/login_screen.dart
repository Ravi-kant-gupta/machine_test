import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:machine_test/login%20screen/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final loginController = Get.put(LoginController());
  GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            SafeArea(
                child: Container(
              width: 60,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Colors.purple, Color.fromARGB(255, 1, 251, 251)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Image.asset(
                'assets/image_micro.png',
                width: 60,
                height: 100,
                fit: BoxFit.cover, // Image fit

                colorBlendMode: BlendMode.color,
              ),
            )),
            SizedBox(
              height: Get.height * 0.04,
            ),
            const Text("SIGN IN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text("TO CONTINUE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Form(
                key: formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: loginController.emailController,
                      cursorColor: Colors.black,
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        fillColor: const Color.fromARGB(255, 231, 229, 229),
                      ),
                      validator: (value2) {
                        if (value2!.isEmpty) {
                          return "Enter Correct Email";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                        controller: loginController.passwordController,
                        cursorColor: Colors.black,
                        cursorWidth: 1,
                        obscureText: loginController.hidePassword.value,
                        decoration: InputDecoration(
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          fillColor: const Color.fromARGB(255, 231, 229, 229),
                          suffixIcon: GestureDetector(
                            onTap: () => loginController.toggle(),
                            child: Icon(
                              loginController.hidePassword.value
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Correct Password";
                          } else {
                            return null;
                          }
                        },
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      loginController.login();
                    },
                    child: Container(
                      width: Get.width * 0.5,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              transform: GradientRotation(10),
                              colors: [
                                Colors.purple,
                                Color.fromARGB(255, 1, 251, 251)
                              ])),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ])),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Lost password?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.4,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          transform: GradientRotation(10),
                          colors: [
                            Color.fromARGB(255, 214, 2, 252),
                            Color.fromARGB(255, 1, 251, 251)
                          ])),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: Get.width * 0.4,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          transform: GradientRotation(10),
                          colors: [
                            Color.fromARGB(255, 210, 1, 247),
                            Color.fromARGB(255, 1, 251, 251)
                          ])),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Facebook",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Divider(
              endIndent: Get.width * 0.4,
              indent: Get.width * 0.4,
              thickness: 2,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
