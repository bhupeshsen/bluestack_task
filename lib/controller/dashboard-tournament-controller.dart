import 'dart:convert';

import 'package:bluestack_task/helper/shared-pref.dart';
import 'package:bluestack_task/local_storage/local_storgae.dart';
import 'package:bluestack_task/models/tournament.dart';
import 'package:bluestack_task/models/users.dart';
import 'package:bluestack_task/service/tournament.dart';
import 'package:bluestack_task/service/user.dart';
import 'package:bluestack_task/view/language-select.dart';
import 'package:bluestack_task/view/tournament-list-by-cursor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
class TournamentController extends GetxController {
  var isLoading = true.obs;
  var isLogout = false.obs;
  var appLocale = 'ja';
  RxString userName=''.obs;
  RxString userPhoto=''.obs;
  RxString cursorKey=''.obs;
  SharedPref sharedPref=SharedPref();
  var tournamentsList = List<Tournaments>().obs;


  @override
  void onInit() {
    updateLanguage();
    getUserSessionData();
    getTournaments();
    super.onInit();
  }

  // for checking selected language
  void updateLanguage() async{
    LocalStorage localStorage = LocalStorage();
    appLocale = await localStorage.languageSelected == null
        ? 'ja'
        : await localStorage.languageSelected;
    update();
    Get.updateLocale(Locale(appLocale));
  }

  // for fetching session data
  void getUserSessionData() async{
    var userData = await UserApiServices.getUserSessionData();
    userName.value=userData.name;
    userPhoto.value=userData.photo;
  }

  // for fetching Tournaments list
  void getTournaments() async {
    try {
      isLoading(true);

      dynamic resultData = await ApiServices.getTournaments();
      dynamic responseJson = json.decode(resultData.data);
      //here we set the tournaments array in to list
      List listData=responseJson['data']['tournaments'];
      cursorKey.value=responseJson['data']['cursor'];
      var tournaments=listData.map((m) => new Tournaments.fromJson(m)).toList();
      if (tournaments != null) {
        tournamentsList.value = tournaments;
        getUserSessionData();
      }
    } finally {
      isLoading(false);
    }
  }

  // for clear all session data
  Future logout() async{
    sharedPref.clear();
    isLogout.value=true;
   // Get.offAll(OnBoarding());
    SystemNavigator.pop();
  }

}
