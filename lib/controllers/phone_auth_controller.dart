import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../view/phone_authentication/screen_otp.dart';
import '../view/screens/screen_home.dart';

class PhoneNumberController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();
  static var vid = ''.obs;

  Future<void> phoneAuthentication() async {
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          Get.snackbar('Successfully', 'You Successfully login');
        },
        verificationFailed: (e) {
          if(e.code == 'invalid-phone-number'){
            Get.snackbar('Error', 'The provided phone number is not valid',
            backgroundColor: Colors.white,);
          }else{
            Get.snackbar('Error', 'Something went wrong try Again',
              backgroundColor: Colors.white,);
          }
        },
        codeSent: (String verificationId, int? token) {
         vid.value = verificationId;
          Get.to(ScreenOtp(vid: verificationId));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          vid.value = verificationId;
        });
  }

  Future<void> verifyPAuthentication() async {
    var credential = PhoneAuthProvider.credential(
        verificationId: vid.value, smsCode: otpCodeController.text);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.to(ScreenHome());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<bool>OtpVerify(String otp)async{
   var credential = await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: vid.value, smsCode: otpCodeController.text));
   return credential.user!= null? true: false;
  }

  Future<UserCredential?> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
