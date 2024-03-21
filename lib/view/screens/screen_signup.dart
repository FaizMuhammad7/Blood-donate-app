import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/view/screens/screen_login.dart';
import '../../controllers/authentication_controller.dart';
import '../../helpers/constants.dart';

class ScreenSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthenticationController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: 'Username'),
                      controller: authController.nameController,
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
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(labelText: 'Confirm Password'),
                      controller: authController.confirmPasswordController,
                    ),
                    SizedBox(height: 30),
                    Obx(() {
                      return SizedBox(
                        height: 52,
                        width: 320,
                        child: ElevatedButton(
                          onPressed: authController.loading.isTrue
                              ? null
                              : () async {
                            await authController.createUser();
                          },
                          child: Obx(
                                () {
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
                                'Sign Up',
                                style: TextStyle(color: Colors.white),
                              );
                            },
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.redColor),
                        ),
                      );
                    }),
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
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Quick and easy login to account',
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
                            Get.to(ScreenLogin());
                          },
                          child: Text(
                            'Sign In',
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
          )),
    );
  }
}
