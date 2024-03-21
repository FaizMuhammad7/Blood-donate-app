import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/view/screens/screen_signup.dart';

import '../../helpers/constants.dart';

class ScreenStarted extends StatelessWidget {
  const ScreenStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.redColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/images/Vector.png',),
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              height: 52,
              width: 320,
              child: ElevatedButton(
                onPressed: (){
                  Get.to(ScreenSignup());
                },
                child: Text('Get Started'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            ),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
