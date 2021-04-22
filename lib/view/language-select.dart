import 'package:bluestack_task/controller/language-controller.dart';
import 'package:bluestack_task/theme/theme-one.dart';
import 'package:bluestack_task/view/dashboard.dart';
import 'package:bluestack_task/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class SelectLanguage extends StatelessWidget {
  static final routeName = '/selectLanguage';
  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
                child: Text(
              "SELECT THE LANGUAGE",
              style: TextStyle(
                  fontSize: 18,
                  color: colorPrimary,
                  fontWeight: FontWeight.bold),
            )),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(25),
                    child: ButtonTheme(
                      minWidth: size.width / 1.75,
                      height: 48,
                      child: Obx(() {
                        return RaisedButton(
                          onPressed: () => {
                            controller.selectLanguage("ja"),
                            controller.selectBtnLanguage(true),
                          },
                          color: controller.userSelectedLanguage.value
                              ? colorPrimary
                              : whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                          child: Text(
                            'Japanese',
                            style: TextStyle(
                                color: controller.userSelectedLanguage.value
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(25),
                    child: ButtonTheme(
                      minWidth: size.width / 1.75,
                      height: 48,
                      child: Obx(() {
                        return RaisedButton(
                          onPressed: () => {
                            controller.selectLanguage("en"),
                            controller.selectBtnLanguage(false),
                          },
                          color: controller.userSelectedLanguage.value
                              ? whiteColor
                              : colorPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                          child: Text(
                            'English',
                            style: TextStyle(
                                color: controller.userSelectedLanguage.value
                                    ? Colors.black
                                    : Colors.white),
                          ),
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Image.asset(
                'assets/images/icon.png',
                width: 100,
                height: 100,
              ),
            ),
            Center(
              child: ButtonTheme(
                minWidth: size.width / 1.75,
                height: 48,
                child: RaisedButton(
                  onPressed: () => {
                    controller.checkUseLogin(),
                  },
                  color: colorPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 48)
          ],
        ),
      ),
    );
  }
}
