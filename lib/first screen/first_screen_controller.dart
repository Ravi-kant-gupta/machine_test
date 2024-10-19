import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token') ?? "";
    if (token != "") {
      Get.offAllNamed('/home');
    }
  }
}
