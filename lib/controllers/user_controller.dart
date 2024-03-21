import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/firebase_helpers.dart';
import '../helpers/mime_type.dart';
import '../models/user_model.dart';
import '../view/screens/screen_picked_blood_group.dart';

class UserController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var genderController = TextEditingController();
  var bloodGroupController = TextEditingController();
  // var userModel = UserModel().obs;

  Future<void> fetchOnlineUserModel() async {
    var doc = await FirebaseFirestore.instance.collection('users')
        .doc(AuthConstants.currentUserId).get();
    if (doc.data() != null) {
     var userModel = UserModel.fromMap(doc.data()!);
      nameController.text = userModel.name;
    }
  }

  Future<void> upDatedDate() async {
    var docs = await FirebaseFirestore.instance
        .collection('users').doc(AuthConstants.currentUserId).update({
      'address' : addressController.text,
      'gender' : genderController.text,
      'b_group' : bloodGroupController.text,
    });
  }

  Future<void> fetchUserData() async {
    var userObj = UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      address: addressController.text,
      gender: genderController.text,
      b_group: bloodGroupController.text,
      user_id: FirebaseAuth.instance.currentUser!.uid,
      pic_url: '',
    );
    saveUserData(userObj);
  }

  Future<void> saveUserData(UserModel userInformationModel) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(userInformationModel.toMap());
    Get.to(ScreenPickedBloodGroup());
  }

  Future<String> uploadPictures(String path, String id) async {
    // String fileName = path.split('/').last;
    String extension = path.split('.').last;
    var ref = FirebaseStorage.instance.ref('image').child('$id.$extension');
    UploadTask uploadTask = ref.putFile(
        File(path), SettableMetadata(contentType: allMimeTypesMap[extension]));
    TaskSnapshot taskSnapshot = await uploadTask;
    var downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
