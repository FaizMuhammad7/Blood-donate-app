import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/helpers/firebase_helpers.dart';

import '../view/screens/screen_home.dart';
import '../view/screens/screen_login.dart';

class emailVerification extends GetxController{

  @override
  void onInit() {
    checkIfUserHasVerifiedEmail();
    super.onInit();
  }

  void checkIfUserHasVerifiedEmail() async {
    if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
      Get.to(ScreenHome());
    } else {
      showDialog(
          context: Get.context!,

          builder: (_) => AlertDialog(
            title: Text("Alert"),
            content: Text("Email not verified yet"),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
            actions: [
              TextButton(
                  onPressed: () {
                    AuthConstants.currentUser?.sendEmailVerification();
                    FirebaseAuth.instance.signOut();
                    Get.offAll(ScreenLogin());
                  },
                  child: Text("Send email"))
            ],
          ),
          barrierDismissible: false,
          barrierColor: Colors.white
      );
    }
  }
}