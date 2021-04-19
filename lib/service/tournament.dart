import 'dart:convert';
import 'package:bluestack_task/helper/constant.dart';
import 'package:bluestack_task/helper/shared-pref.dart';
import 'package:bluestack_task/models/tournament.dart';
import 'package:bluestack_task/models/users.dart';
import 'package:dio/dio.dart';

class ApiServices{

  static var dio = new Dio();// dio object is use for http request



  // getTournaments function is use for fetching the tournaments data
  // complete url http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all
  static Future<dynamic> getTournaments() async {
    Response<String> response = await dio.get('$TOURNAMENTS_API/tournaments_list_v2?limit=10&status=all');
    if (response.statusCode == 200) {
      dio.options.headers['content-Type'] = 'application/json';
      return response;
    } else {
      return null;
    }
  }


  // getTournamentsByCursor this function is use for fetching tournaments data by Cursor
  static Future<List<Tournaments>> getTournamentsByCursor(pageNo,cursor) async {
    // here when i used page no it always fetching  same data from server
    Response<String> response = await dio.get('$TOURNAMENTS_API/tournaments_list_v2?limit=10&page=$pageNo&status=all&cursor=&$cursor');
    if (response.statusCode == 200) {
      dio.options.headers['content-Type'] = 'application/json';
      dynamic responseJson = json.decode(response.data);
      //here we set the tournaments array in to list
      List listData=responseJson['data']['tournaments'];
      return listData.map((m) => new Tournaments.fromJson(m)).toList();
    } else {
      //show error message
      return null;
    }
  }



}
