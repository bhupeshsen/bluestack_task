import 'package:bluestack_task/helper/shared-pref.dart';
import 'package:bluestack_task/helper/util.dart';
import 'package:bluestack_task/models/tournament.dart';
import 'package:bluestack_task/service/tournament.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CursorTournamentController extends GetxController{
  var isLoading = true.obs;
  var page = 1;
  var isMoreDataAvailable = true.obs;
  ScrollController scrollController = ScrollController();
  var tournamentsList = List<Tournaments>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
  }


  // For fetching cursor tournaments its run first time when page no is 1
  void getTournaments() async {
    tournamentsList.clear();
    tournamentsList = List<Tournaments>.empty(growable: true).obs;
    page=1;
    scrollController = ScrollController();
    try {
      isLoading(true);
      String cursor=Get.arguments[0];
      print("bhs"+cursor);
      var list = await ApiServices.getTournamentsByCursor("1",cursor);
      if (list != null) {
        tournamentsList.addAll(list);
        paginateList();
      }
    } finally {
      isLoading(false);
    }
  }

  // For Pagination
  void paginateList() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        getMoreTournaments();
      }
    });
  }

  // get more tournaments list
  // in this function i have manage exception with pagination
  void getMoreTournaments() async {
    try {
      await ApiServices.getTournamentsByCursor(page,Get.arguments[0]).then((list) {
        if (list.length > 0) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          showSnackBar("Message", "No more items", Colors.lightBlueAccent);
        }
        tournamentsList.addAll(list);
      }, onError: (err) {
        isMoreDataAvailable(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
  }


}