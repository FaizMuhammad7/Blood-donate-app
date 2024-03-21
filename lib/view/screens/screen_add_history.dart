import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/controllers/receiver_controller.dart';
import 'package:my_blood_donate_app/view/screens/screen_home.dart';
import '../../helpers/constants.dart';


class ScreenAddHistory extends StatelessWidget {
var receiverController = Get.put(ReceiverController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Column(
          children: [
            Image(
              image: AssetImage('assets/images/Vector2.png'),
              height: 30,
              width: 30,
            ),
            Text(
              'Doner History',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_outlined),),
        surfaceTintColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add details',
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text('Receiver Name',
                  style: TextStyle(
                      color: Colors.grey)),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: receiverController.nameController,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MyColors.naturalLight,
                  hintText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Reason',
                  style: TextStyle(
                      color: Colors.grey)),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: receiverController.reasonController,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MyColors.naturalLight,
                  hintText: 'Blood Cancer',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Blood quantity',
                  style: TextStyle(
                      color: Colors.grey)),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: receiverController.quantityController,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MyColors.naturalLight,
                  hintText: '100 ml',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Receiver blood group',
                  style: TextStyle(
                      color: Colors.grey)),
              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                controller: receiverController.groupController,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MyColors.redColor,
                  hintText: 'O',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Receiver Gender',
                  style: TextStyle(
                      color: Colors.grey)),
              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                controller: receiverController.genderController,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MyColors.redColor,
                  hintText: 'Male',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Address',
                  style: TextStyle(
                      color: Colors.grey)),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: receiverController.addressController,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MyColors.naturalLight,
                  hintText: 'Kalam chock Bypass',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Receiver age',
                  style: TextStyle(
                      color: Colors.grey)),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: receiverController.ageController,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MyColors.naturalLight,
                  hintText: '20 Age',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 48,
                width: 320,
                child: ElevatedButton(
                  onPressed: () {
                    receiverController.fetchSaveReceiverData();
                    Get.to(ScreenHome());
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.redColor),
                ),
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
