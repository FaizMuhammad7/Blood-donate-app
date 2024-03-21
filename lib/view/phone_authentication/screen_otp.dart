import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/helpers/constants.dart';
import '../../controllers/phone_auth_controller.dart';

class ScreenOtp extends StatelessWidget {
  String vid;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PhoneNumberController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OtpTextField(
            mainAxisAlignment:MainAxisAlignment.center ,
            keyboardType: TextInputType.phone,
            numberOfFields: 6,
            filled: true,
            fillColor: Colors.grey,
            fieldWidth: 30,
            borderColor: Colors.purple,
            onSubmit: (code){
              vid = code;
              controller.OtpVerify(vid);
            },
          ),
          ElevatedButton(
            onPressed: () {
              controller.OtpVerify(vid);
              // controller.verifyPAuthentication();
            },
            child: Text(
              'Verify Your OTP',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.redColor,
              fixedSize: Size(290,48),
            ),
          ),
        ],
      ).paddingAll(30),
    );
  }

  ScreenOtp({
    required this.vid,
  });
}
