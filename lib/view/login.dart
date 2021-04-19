import 'package:bluestack_task/controller/login-controller.dart';
import 'package:bluestack_task/langs/en.dart';
import 'package:bluestack_task/langs/ja.dart';
import 'package:bluestack_task/theme/theme-one.dart';
import 'package:bluestack_task/view/dashboard.dart';
import 'package:bluestack_task/widget/custom-containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';

class UserLogin extends StatelessWidget {
  static final routeName = '/userLogin';
  final LoginController loginController = Get.put(LoginController());
  String _selectedLang = 'en';

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          clipBehavior: Clip.hardEdge,
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 16, top: 120),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/icon.png',
                        width: 64,
                        height: 64,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("login".tr,
                          style: Theme.of(context).textTheme.headline5.merge(
                              TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedContainer(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 50),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Obx(() {
                            // we can also use maxLength: 10,
                            return TextFormField(
                              onChanged: loginController.userNameChange,
                              keyboardType: TextInputType.text,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: 'username'.tr,
                                  errorText:
                                      loginController.userNameErrorText.value,
                                  focusColor: colorPrimary,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none),
                            );
                          }),
                          Divider(color: Colors.grey),
                          Obx(() {
                            // we can also use maxLength: 10,
                            return TextFormField(
                              onChanged: loginController.passwordChange,
                              obscureText:
                                  loginController.passwordHideShow.value ==
                                          "hide"
                                      ? true
                                      : false,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  errorText:
                                      loginController.passwordErrorText.value,
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        loginController
                                                    .passwordHideShow.value ==
                                                "hide"
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: colorPrimary),
                                    padding:
                                        EdgeInsets.only(right: 45, left: 5),
                                    onPressed: () => {
                                      loginController.toggle(loginController
                                          .passwordHideShow.value)
                                    },
                                  ),
                                  hintText: 'password'.tr,
                                  focusColor: colorPrimary,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none),
                            );
                          })
                        ],
                      ),
                      Obx(() {
                        return Positioned(
                          right: -24,
                          top: 0,
                          bottom: 0,
                          child: FloatingActionButton(
                              disabledElevation: 0,
                              backgroundColor:
                                  loginController.submitBtnCheck.value
                                      ? colorPrimary
                                      : Colors.black45,
                              onPressed: () {
                                if (loginController.submitBtnCheck.value) {
                                  loginController.userLogin();
                                }
                              },
                              child: loginController.indicatorLoader.value
                                  ? Center(
                                      child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: CircularProgressIndicator(
                                              valueColor:
                                                  new AlwaysStoppedAnimation<
                                                      Color>(Colors.white),
                                              backgroundColor: colorPrimary)))
                                  : Icon(
                                      Icons.arrow_forward,
                                      color:
                                          loginController.submitBtnCheck.value
                                              ? Colors.white
                                              : Colors.black45,
                                    )),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: -10,
                right: -(media.width / 6),
                child: Container(
                  height: media.width / 3,
                  width: media.width / 3,
                  decoration:
                      BoxDecoration(color: accentColor, shape: BoxShape.circle),
                )),
            Positioned(
                bottom: -(media.width / 6),
                right: 10,
                child: Container(
                  height: media.width / 3,
                  width: media.width / 3,
                  decoration: BoxDecoration(
                      color: colorPrimary, shape: BoxShape.circle),
                )),
          ],
        ));
  }
}
