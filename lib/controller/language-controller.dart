import 'dart:convert';
import 'dart:ffi';
import 'package:bluestack_task/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:bluestack_task/helper/shared-pref.dart';
import 'package:bluestack_task/local_storage/local_storgae.dart';
import 'package:bluestack_task/models/users.dart';
import 'package:bluestack_task/view/dashboard.dart';
 import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LanguageController extends GetxController {
  SharedPref sharedPref =SharedPref();
  RxBool sessionCheck= false.obs;
  RxBool userSelectedLanguage= false.obs;
  Users users=Users();
  var appLocale = 'ja';

  @override
  void onInit() {
    updateLanguage();
    selectLanguage("en");
    super.onInit();
  }

  // this function is use for checking the user session
  void checkUseLogin() async{
    dynamic sessionData = await sharedPref.read('userData', false);
    if(sessionData!=null){
      dynamic  jsonData=json.decode(sessionData);
      users=Users.fromJson(jsonData);
      print("data"+jsonData['status'].toString());
      if(users.status=true){
          Get.offAll(Dashboard());
      }else{
        Get.offAll(UserLogin());
      }

    }else{
      sessionCheck.value=false;
      Get.offAll(UserLogin());
    }
    update();
  }

  // for fetching updated language
  void updateLanguage() async{
    LocalStorage localStorage = LocalStorage();

    appLocale = await localStorage.languageSelected == null
        ? 'ja'
        : await localStorage.languageSelected;
    update();
    Get.updateLocale(Locale(appLocale));
  }

  // for selecting language English/japanese
  void selectLanguage(String type) async {
    LocalStorage localStorage = LocalStorage();
    if (appLocale == type) {
      return;
    }
    if (type == 'ja') {
      appLocale = 'ja';
      localStorage.saveLanguageToDisk('ja');
    } else {
      appLocale = 'en';
      localStorage.saveLanguageToDisk('en');
    }
    update();
  }

  // for changing the selection button color
  void selectBtnLanguage(bool value){
    userSelectedLanguage.value=value;
    update();
  }
}
