import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/controllers/user_controller.dart';
import 'package:my_blood_donate_app/helpers/firebase_helpers.dart';
import 'package:my_blood_donate_app/view/screens/screen_home.dart';
import 'package:my_blood_donate_app/view/screens/screen_picked_blood_group.dart';
import '../../helpers/constants.dart';
import '../../models/user_model.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_field.dart';

class ScreenInformation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: DbConstants.usersRef
                  .doc(AuthConstants.currentUserId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading...');
                }

                var userObj = UserModel.fromMap(
                    snapshot.data!.data() as Map<String, dynamic>);
                return Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/Vector2.png'),
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Information',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      // controller: userObj.name,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: MyColors.naturalLight,
                        hintText: userObj.name,
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: userController.genderController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: MyColors.naturalLight,
                        hintText: 'Gender',
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

                    MyTextField(
                      keyboardType: TextInputType.streetAddress,
                      controller: userController.addressController,
                      border: InputBorder.none,
                      field: true,
                      fillColor: MyColors.naturalLight,
                      hintText: 'Address',
                    ),
                    SizedBox( height: 50),
                    MyButton(
                        Text: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Get.to(ScreenPickedBloodGroup());
                          },
                    ),
                  ],
                );
              },
            ),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
