import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/helpers/firebase_helpers.dart';
import 'package:my_blood_donate_app/models/user_model.dart';
import 'package:my_blood_donate_app/view/screens/screen_login.dart';
import '../../controllers/authentication_controller.dart';
import '../../helpers/constants.dart';

class ScreenProfile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthenticationController());

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color: Colors.grey,),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(),

                      title: Text(
                        'Are you sure you want to logout?',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('No')),
                        TextButton(
                            onPressed: () {
                              authController.logoutUser();
                              Get.to(ScreenLogin());
                            },
                            child: Text('Yes')),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.logout, color: Colors.grey),
          ),
          // IconButton(
          //     onPressed: () async {
          //       await GoogleSignIn().signOut();
          //       Get.to(ScreenLoginWithPhoneNumber());
          //     },
          //     icon: Icon(Icons.logout)),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child:StreamBuilder<DocumentSnapshot?>(
                  stream: DbConstants.usersRef
                      .doc(AuthConstants.currentUserId).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: MyColors.redColor,
                        ),
                      );
                    }

                    var userObj = UserModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);

                    return Column(
                      children: [

                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              foregroundImage: AssetImage(
                                'assets/images/profile_picture.png',
                              ),
                            ),
                            Positioned(
                              left: 45,
                              top: 40,
                              child: IconButton(
                                onPressed: () async {},
                                icon: Icon(
                                  Icons.camera_alt,
                                ),
                                color: MyColors.redColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(userObj.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                            fontSize: 20),),
                        SizedBox(height: 30),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Bio Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          leading: Text(
                            'Name :',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          title: Text(userObj.name),
                          tileColor: MyColors.naturalLight,
                        ),
                        SizedBox(height: 5),
                        ListTile(
                          leading: Text(
                            'Blood Group :',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          title: Text(userObj.b_group),
                          tileColor: MyColors.naturalLight,
                        ),
                        SizedBox(height: 5),
                        ListTile(
                          leading: Text(
                            'Gender :',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          title: Text(userObj.gender),
                          tileColor: MyColors.naturalLight,
                        ),
                        SizedBox(height: 5),
                        ListTile(
                          leading: Text(
                            'Address :',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          title: Text(userObj.address),
                          tileColor: MyColors.naturalLight,
                        ),
                      ],
                    );
                  },
                ),
            ),
            Image(
              image: AssetImage('assets/images/Vector2.png'),
              height: 30,
              width: 30,
            ),
            Text(
              'Blood Now',
              style: TextStyle(
                  fontSize: 16,
                  color: MyColors.redColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ).paddingAll(10),
      ),
    );
  }
}
