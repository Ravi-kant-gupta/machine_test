import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var fullName = ''.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var planType = ''.obs;
  var gender = ''.obs;
  var accessToken = ''.obs;
  var isVerified = false.obs;

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fullName.value = prefs.getString('full_name') ?? '';
    firstName.value = prefs.getString('first_name') ?? '';
    lastName.value = prefs.getString('last_name') ?? '';
    email.value = prefs.getString('email') ?? '';
    planType.value = prefs.getString('plan_type') ?? '';
    gender.value = prefs.getString('gender') ?? '';
    accessToken.value = prefs.getString('access_token') ?? '';
    isVerified.value = prefs.getInt('is_verified') == 1;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed('/');
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }
}
