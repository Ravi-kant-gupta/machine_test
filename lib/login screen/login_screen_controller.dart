import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var hidePassword = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toggle() {
    hidePassword.value = !hidePassword.value;
  }

  Future<bool> isInternetAvailableNew() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  final MethodChannel _channel =
      MethodChannel('com.methodchaneltask.machine_test/login');

  Future<void> login() async {
    bool connect = await isInternetAvailableNew();
    if (connect) {
      Get.dialog(Center(child: CircularProgressIndicator()));
      final String result = "";
      try {
        var body = {
          // 'email': "ron@yopmail.com",
          'email': emailController.text,
          // 'password': "Test@123",
          'password': passwordController.text,
          'device_token': 'test',
          'device_type': GetPlatform.isAndroid ? 'android' : 'ios'
        };
        final String result = await _channel.invokeMethod('login', body);
        var x = Response.fromJson(jsonDecode(result));
        if (x.statusCode == 200 &&
            (x.message ?? "").toLowerCase() == "login successfully.") {
          print("Success");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', x.data!.accessToken ?? "");
          await prefs.setString('email', x.data!.email ?? "");
          await prefs.setString('full_name', x.data!.fullName ?? "");
          await prefs.setInt('id', x.data!.id ?? 0);
          await prefs.setString('plan_type', x.data!.planType ?? "");
          Get.offAllNamed('/home');
        }
      } catch (e) {
        Fluttertoast.showToast(
            msg: "Failed to Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        print(e);
      } finally {
        Get.back();
      }
    } else {
      Fluttertoast.showToast(
          msg: "No Internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

class Response {
  String? apiResponse;
  int? statusCode;
  String? message;
  Data? data;

  Response({this.apiResponse, this.statusCode, this.message, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    apiResponse = json['api_response'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_response'] = this.apiResponse;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  int? id;
  String? fullName;
  String? firstName;
  String? lastName;
  String? email;
  int? isVerified;
  String? planType;
  dynamic? phoneNumber;
  dynamic? address;
  dynamic? zipCode;
  dynamic? countryCode;
  String? gender;
  dynamic? dob;
  dynamic? countryShortCode;

  Data(
      {this.accessToken,
      this.id,
      this.fullName,
      this.firstName,
      this.lastName,
      this.email,
      this.isVerified,
      this.planType,
      this.phoneNumber,
      this.address,
      this.zipCode,
      this.countryCode,
      this.gender,
      this.dob,
      this.countryShortCode});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    id = json['id'];
    fullName = json['full_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isVerified = json['is_verified'];
    planType = json['plan_type'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    zipCode = json['zip_code'];
    countryCode = json['country_code'];
    gender = json['gender'];
    dob = json['dob'];
    countryShortCode = json['country_short_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['is_verified'] = this.isVerified;
    data['plan_type'] = this.planType;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['zip_code'] = this.zipCode;
    data['country_code'] = this.countryCode;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['country_short_code'] = this.countryShortCode;
    return data;
  }
}
