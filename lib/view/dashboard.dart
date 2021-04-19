import 'package:bluestack_task/controller/dashboard-tournament-controller.dart';
import 'package:bluestack_task/theme/theme-one.dart';
import 'package:bluestack_task/view/language-select.dart';
import 'package:bluestack_task/view/tournament-list-by-cursor.dart';
import 'package:bluestack_task/widget/recommended-tournaments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class Dashboard extends StatelessWidget {
  static final routeName = '/dashboard';
  final TournamentController tournamentController =
      Get.put(TournamentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        actions: [
          Container(
              padding: EdgeInsets.all(10),
              child: IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () => {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Are you sure want to logout '),
                              actions: [
                                TextButton(
                                  child: Text('No'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                TextButton(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    tournamentController.logout();
                                  },
                                )
                              ],
                            );
                          },
                        ),
                      }))
        ],
        centerTitle: true,
        title: Text(
          'Flyingwolf',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25,
                ),
                Center(
                  child:Container(
                      width: 90.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                          color:  Colors.white,
                          image: DecorationImage(
                              image: new NetworkImage(tournamentController.userPhoto.value),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [

                            BoxShadow(blurRadius: 7.0,
                              offset: Offset(0, 5),
                              color: kShadowColor,
                            )
                          ])),
                ),

                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Obx(() {
                      return Text(
                        tournamentController.userName.value ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          border:
                              Border.all(color: Color(0xFF7E9AFF), width: 2)),
                      child: Row(
                        children: [
                          Text(
                            '2250',
                            style: TextStyle(
                                color: Color(0xFF7E9AFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Elo rating',
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(18),
                      margin: EdgeInsets.all(0.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: yellowGradient)),
                      child: Column(
                        children: [
                          Text(
                            '34',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "tournamentsPlayed".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(18),
                      margin: EdgeInsets.all(0.5),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: purpleGradient)),
                      child: Column(
                        children: [
                          Text(
                            '09',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "tournamentsWon".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(18),
                      margin: EdgeInsets.all(0.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: orangeGradient)),
                      child: Column(
                        children: [
                          Text(
                            '26%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "tournamentsPercentage".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'Recommended for you',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (tournamentController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: tournamentController.tournamentsList.length,
                  itemBuilder: (context, index) {
                    return RecommendedTournament(
                        tournamentData:
                            tournamentController.tournamentsList[index],
                        position: index,
                        onClick: (tournament) {
                          Get.to(TournamentListByCursor(), arguments: [
                            tournamentController.cursorKey.value,
                            tournament.gameName
                          ]);
                        });
                  },
                );
            }),
          )
        ],
      ),
    );
  }
}
