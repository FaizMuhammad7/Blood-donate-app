import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../view/screens/screen_home.dart';
import '../view/screens/screen_information.dart';

class AuthenticationController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var loading = false.obs;


  // user creation method
  Future<void> createUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', "Passwords don't match",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    loading.value = true;
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text).then((
        value) async {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(
          nameController.text);

      var modelObj = UserModel(user_id: value.user!.uid, name: nameController.text,
          email: emailController.text, password: passwordController.text,
      pic_url: '', address: '',b_group: '', gender: '');
      await saveUserData(modelObj);

      loading.value = false;
      Get.offAll(ScreenHome());
    }).catchError((error) {
      loading.value = false;
      Get.snackbar('Error', error.toString());
    });
  }

  // user login method
  Future<String> loginUser() async {
    loading.value = true;
    var response = '';
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text).then((value) async {
      await FirebaseAuth.instance.currentUser?.reload();
      var verified = await FirebaseAuth.instance.currentUser?. emailVerified ?? false;
      response = verified ? 'success' : 'email not verified yet?';
      loading.value = false;
      Get.offAll(ScreenInformation());
    }).catchError((error){
      loading.value = false;
      response = error.toString();
      Get.snackbar('Error', error.toString());
    });
    return response;
  }

  // forgot password method
  Future<void> forgotPassWordEmail () async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
  }

// logout user method
  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }


// firebaseFireStore
  Future<void> saveUserData (UserModel userModel) async {
    await FirebaseDatabase.instance.ref('users').child(userModel.user_id).set(userModel.toMap());
  }


}