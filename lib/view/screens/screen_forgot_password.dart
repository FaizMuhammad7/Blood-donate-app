import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/authentication_controller.dart';
import '../../helpers/constants.dart';


class ScreenForgotPassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthenticationController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        leading: IconButton(
          onPressed: (){Get.back();},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
                'Enter your email and we will send you a link to reset your password.'),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              controller: authController.emailController,
            ),
            SizedBox(
              height: 52,
              width: 320,
              child: ElevatedButton(
                onPressed: () {
                  authController.forgotPassWordEmail();
                  Get.back();
                },
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.redColor),
              ),
            ).paddingOnly(top: 150),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
