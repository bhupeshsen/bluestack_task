import 'package:bluestack_task/controller/cursor-turnament-controller.dart';
import 'package:bluestack_task/theme/theme-one.dart';
import 'package:bluestack_task/widget/recommended-tournaments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentListByCursor extends StatelessWidget {
  static final routeName = '/tournamentListByCursor';
  final CursorTournamentController controller =
      Get.put(CursorTournamentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          Get.arguments[1],
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GetBuilder<CursorTournamentController>(
              initState: (data) => controller.getTournaments(),
              builder: (controller) {
                return Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else
                      return ListView.builder(
                        controller: controller.scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.tournamentsList.length,
                        itemBuilder: (context, index) {
                          if (index == controller.tournamentsList.length - 1 &&
                              controller.isMoreDataAvailable.value == true) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return RecommendedTournament(
                              tournamentData:
                                  controller.tournamentsList[index]);
                        },
                      );
                  }),
                );
              })
        ],
      ),
    );
  }
}
