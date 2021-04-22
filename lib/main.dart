import 'package:bluestack_task/helper/translations.dart';
import 'package:bluestack_task/theme/theme-one.dart';
import 'package:bluestack_task/view/dashboard.dart';
import 'package:bluestack_task/view/login.dart';
import 'package:bluestack_task/view/language-select.dart';
import 'package:bluestack_task/view/tournament-list-by-cursor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'helper/shared-pref.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  SharedPref sharedPref = SharedPref();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flyingwolf",
      translations: Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      initialRoute: "/",
      routes: {
        '/':(context)=> SelectLanguage(),
        UserLogin.routeName :(context)=>UserLogin(),
        Dashboard.routeName :(context)=>Dashboard(),
        TournamentListByCursor.routeName :(context)=>TournamentListByCursor(),
      },
      theme: ThemeData(
        primaryColor: colorPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

    );
  }

}

