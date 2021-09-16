import 'package:cadevo/constants/asset_path.dart';
import 'package:cadevo/controllers/appController.dart';
import 'package:cadevo/screens/authentication/widgets/bottom_text.dart';
import 'package:cadevo/screens/authentication/widgets/login.dart';
import 'package:cadevo/screens/authentication/widgets/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 10),
                  child: Image.asset(
                    fox,
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 140,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width / 1.5),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 90,
                    ),
                    Visibility(
                        visible: _appController.isLoginWidgetDisplayed.value,
                        child: LoginWidget()),
                    Visibility(
                        visible: !_appController.isLoginWidgetDisplayed.value,
                        child: RegistrationWidget()),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: _appController.isLoginWidgetDisplayed.value,
                      child: BottomTextWidget(
                        onTap: () {
                          _appController.changeDIsplayedAuthWidget();
                        },
                        text1: "Don\'t have an account?",
                        text2: "Create account!",
                      ),
                    ),
                    Visibility(
                      visible: !_appController.isLoginWidgetDisplayed.value,
                      child: BottomTextWidget(
                        onTap: () {
                          _appController.changeDIsplayedAuthWidget();
                        },
                        text1: "Already have an account?",
                        text2: "Sign in!",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
