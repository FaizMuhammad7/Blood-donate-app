import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/helpers/constants.dart';
import '../../controllers/phone_auth_controller.dart';
import '../screens/screen_home.dart';


class ScreenLoginWithPhoneNumber extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PhoneNumberController());
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              controller: controller.phoneController,
              decoration: InputDecoration(
                labelText: 'Enter your phone number',
              ),
            ),
            SizedBox(height: 70),
            ElevatedButton(
                onPressed: (){
                  controller.phoneAuthentication();
                  print('hello');
                }, child: Text('Login',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.redColor,
                fixedSize: Size(290,48),
              ),
            ),
            SizedBox(height: 70),
            ElevatedButton(
              onPressed: (){
                controller.loginWithGoogle();
                Get.to(ScreenHome());
                print('hello');
              }, child: Text('Login with Google',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.redColor,
                fixedSize: Size(290,48),
              ),
            ),
          ],
        ).paddingAll(30),
      ),
    );
  }
}
