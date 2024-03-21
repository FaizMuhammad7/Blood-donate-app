import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/view/screens/screen_forgot_password.dart';
import 'package:my_blood_donate_app/view/screens/screen_home.dart';
import 'package:my_blood_donate_app/view/screens/screen_information.dart';
import 'package:my_blood_donate_app/view/screens/screen_signup.dart';

import '../../controllers/authentication_controller.dart';
import '../../helpers/constants.dart';
import '../../helpers/firebase_helpers.dart';

class ScreenLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthenticationController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/Vector2.png'),
                    height: 100,
                    width: 100,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    controller: authController.emailController,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(labelText: 'Password'),
                    controller: authController.passwordController,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(ScreenForgotPassword());
                      },
                      child: Text('Forgot your password?'),
                    ),
                  ),
                  SizedBox( height: 30),
                  SizedBox(
                    height: 52,
                    width: 320,
                    child: ElevatedButton(
                      onPressed: authController.loading.isTrue
                          ? null : () async {
                        var response = await authController.loginUser();
                        if(AuthConstants.isUserLoggedIn == AuthConstants.currentUser){
                          Get.offAll(ScreenHome());
                        } else  if (response == 'success') {
                          Get.offAll(ScreenInformation());
                        }
                        else {
                          var emailNotVerifiedError = response
                              .toLowerCase().contains("email not verified");
                          showDialog( context: context,
                            builder: (_) =>
                                AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(),
                                  title: Text("Alert"),
                                  content: Text(response),
                                  actions: [
                                    if (emailNotVerifiedError)
                                      TextButton(
                                          onPressed: () async {
                                            FirebaseAuth.instance.currentUser
                                                ?.sendEmailVerification();
                                            FirebaseAuth.instance.signOut();
                                            Get.back();
                                          },
                                          child: Text("Resend email"))
                                  ],
                                ),
                            barrierDismissible: false,
                          );
                        }
                      },
                      child: Obx(() {
                        return authController.loading.isTrue
                            ? SizedBox(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          ),
                        )
                            : Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        );
                      },
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.redColor),
                    ),
                  ),
                ],
              ).paddingAll(20),
            ),
            Positioned(
              top: 490,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Not yet registered?',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Registration is quick and easy',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(ScreenSignup());
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: MyColors.redColor),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                      ),
                    ),
                  ],
                ).paddingAll(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
