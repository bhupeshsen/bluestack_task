import 'dart:convert';
import 'package:bluestack_task/helper/constant.dart';
import 'package:bluestack_task/helper/shared-pref.dart';
import 'package:bluestack_task/models/tournament.dart';
import 'package:bluestack_task/models/users.dart';
import 'package:dio/dio.dart';

class UserApiServices {
  static var dio = new Dio();


  // here getUserLogin function is use for user login from server
  // here i am passing param in map number:'',password:''
  static Future<dynamic> getUserLogin(map) async {
    FormData body = FormData.fromMap(map);
    Response<String> response = await dio.post('$USER_API/login', data: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      //show error message
      return null;
    }
  }


  // here getUserSessionData function is use for getting data from SharedPreferences
  // SharedPreferences is class for storing local data in session
  static Future<Users> getUserSessionData() async {
    SharedPref sharedPref = SharedPref();
    dynamic data = await sharedPref.read('userData', false);
    dynamic jsonData = json.decode(data);
    Users users = Users.fromJson(jsonData);
    return users;
  }

}
