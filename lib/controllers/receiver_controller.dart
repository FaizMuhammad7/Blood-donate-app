import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/helpers/firebase_helpers.dart';
import '../models/receiver_model.dart';

class ReceiverController extends GetxController {
  var nameController = TextEditingController();
  var reasonController = TextEditingController();
  var quantityController = TextEditingController();
  var groupController = TextEditingController();
  var genderController = TextEditingController();
  var addressController = TextEditingController();
  var ageController = TextEditingController();


  Future<void> saveReceiverData(ReceiverModel receiverAddHistoryModel) async {
    await DbConstants.receiverRef.doc(AuthConstants.currentUserId)
        .set(receiverAddHistoryModel.toMap());
  }

  void fetchSaveReceiverData() async {
    var receiverObject = ReceiverModel(
      name: nameController.text,
      reason: reasonController.text,
      b_group: groupController.text,
      gender: genderController.text,
      address: addressController.text,
      age: ageController.text,
      b_quantity: quantityController.text,
    );
    saveReceiverData(receiverObject);
  }
}
