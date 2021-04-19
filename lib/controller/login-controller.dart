import 'dart:convert';

import 'package:bluestack_task/helper/shared-pref.dart';
import 'package:bluestack_task/helper/util.dart';
import 'package:bluestack_task/langs/en.dart';
import 'package:bluestack_task/langs/ja.dart';
import 'package:bluestack_task/local_storage/local_storgae.dart';
import 'package:bluestack_task/models/users.dart';
import 'package:bluestack_task/service/tournament.dart';
import 'package:bluestack_task/service/user.dart';
import 'package:bluestack_task/view/dashboard.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  var appLocale = 'ja';
  SharedPref sharedPref = SharedPref();
  RxString passwordHideShow = "hide".obs;
  RxString username = ''.obs;
  RxString selectDrop = 'en'.obs;
  RxString password = ''.obs;
  RxString userNameErrorText = RxString(null);
  RxString passwordErrorText = RxString(null);
  RxBool submitBtnCheck = false.obs;
  RxBool indicatorLoader = false.obs;


  @override
  void onInit() {
    updateLanguage();
    super.onInit();
  }

  // for fetching selected language
  void updateLanguage() async {
    LocalStorage localStorage = LocalStorage();
    appLocale = await localStorage.languageSelected == null
        ? 'ja'
        : await localStorage.languageSelected;
    update();
    Get.updateLocale(Locale(appLocale));
  }

  // for hide showing the password
  void toggle(String val) {
    if (passwordHideShow.value == "hide") {
      passwordHideShow.value = "show";
    } else {
      passwordHideShow.value = "hide";
    }
  }

  // for checking the username and password length
  bool validations(String type, {int minLen = 3, int maxLen = 10}) {
    passwordErrorText.value = null; // reset validation
    userNameErrorText.value = null;
    indicatorLoader.value = false;
    submitBtnCheck.value = false; // disable submit while validating
    if (username.value.length < minLen && type == "userName") {
      userNameErrorText.value = 'minUsernameError'.tr;
      return false;
    } else
    if (username.value.length > minLen && username.value.length > maxLen &&
        type == "userName") {
      userNameErrorText.value = 'maxUsernameError'.tr;
      return false;
    } else if (username.value.length > maxLen) {
      userNameErrorText.value = 'maxUsernameError'.tr;
      return false;
    } else if (password.value.length > maxLen) {
      passwordErrorText.value = 'maxPassError'.tr;
      return false;
    } else if (password.value.length < minLen && type == "password") {
      passwordErrorText.value = 'minPassError'.tr;
      return false;
    } else
    if (password.value.length > minLen && password.value.length > maxLen &&
        type == "password") {
      passwordErrorText.value = 'maxPassError'.tr;
      return false;
    }
    return true;
  }

  // this function is use for check all validation then it enable the login button
  void checkValidations(String type) async {
    if (validations(type) && password.value.length >= 3 &&
        username.value.length >= 3) {
      submitBtnCheck.value = true;
    }
  }

  // this function is use authentication form server
  Future userLogin() async {
    indicatorLoader.value = true;
    Map<String, dynamic> map = {
      "number": username.value,
      "password": password.value,
    };
    dynamic userData = await UserApiServices.getUserLogin(map);
    dynamic data = json.decode(userData.data);
    if (userData != null) {
      if (data['status'] == true) {
        indicatorLoader.value = false;
        sharedPref.save("userData", userData.data, false);
        showSnackBar("Success", data['message'], Colors.green);
        Get.offAll(Dashboard());
      } else {
        indicatorLoader.value = false;
        showSnackBar("Error", data['message'], Colors.redAccent);
      }
    } else {
      indicatorLoader.value = false;
      showSnackBar("Error", data['message'], Colors.redAccent);
    }
  }

  // it get password value then check validation
  void passwordChange(String val) {
    password.value = val;
    checkValidations("password");
  }

  // it get user name  value then check validation
  void userNameChange(String val) {
    username.value = val;
    checkValidations("userName");
  }

}
