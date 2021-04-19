import 'package:bluestack_task/models/tournament.dart';
import 'package:bluestack_task/theme/theme-one.dart';
import 'package:flutter/material.dart';
class RecommendedTournament extends StatelessWidget {
  final Tournaments tournamentData;
  final ValueChanged<Tournaments> onClick;
  final int position;
  const RecommendedTournament({this.tournamentData,this.position,this.onClick});
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Container(
      height: 155,
      padding: EdgeInsets.all(0),


      decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          shape: BoxShape.rectangle,
          borderRadius:   BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ]),

      margin: EdgeInsets.only(left: 20,right: 20,top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(

            borderRadius:BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
            child:Image.network(
              tournamentData.coverUrl,
              fit: BoxFit.cover,
              height: 80,
              width: size.width,
            ),
          ),

          ListTile(
            title: Text(tournamentData.name, textAlign: TextAlign.start, maxLines: 1, style: kTitleStyle),
            subtitle: Text(tournamentData.gameName,textAlign: TextAlign.left,style: kSubtitleStyle),
            trailing: position == 0 ?Icon(Icons.keyboard_arrow_right) : SizedBox(),
            onTap: () {
              if(position == 0) {onClick(tournamentData);}
            },
          )
        ],
      ),
    );
  }
}
