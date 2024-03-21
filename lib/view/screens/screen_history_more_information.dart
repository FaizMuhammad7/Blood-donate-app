import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/controllers/receiver_controller.dart';
import 'package:my_blood_donate_app/helpers/firebase_helpers.dart';
import '../../helpers/constants.dart';
import '../../models/receiver_model.dart';

class ScreenHistoryMoreInformation extends StatelessWidget {
  var receiverController = Get.put(ReceiverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'History more information',
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Positioned(
                      top: 10,
                      left: 7,
                      right: 7,
                      child: Container(
                        height: 170,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: MyColors.redColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                'Receiver',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                'Muhammad Ali',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image(
                                    height: 80,
                                    width: 80,
                                    image: AssetImage('assets/images/Vector.png')),
                              ],
                            ),
                          ],
                        ).paddingAll(8),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Bio Information',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('receiver').where('user_id',isEqualTo: AuthConstants.currentUserId)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: MyColors.redColor,
                                    strokeWidth: 3,
                                  ),
                                ),
                              );
                            }

                            var result = snapshot.data;
                            if (result == null) {
                              return Center(
                                child: Text('No Data.....'),
                              );
                            }

                            var docs = result.docs;
                            var historyList = docs.map((e) => ReceiverModel.fromMap(
                                e.data() as Map<String, dynamic>),
                            ).toList();

                            return ListView.builder(
                              itemCount: historyList.length,
                                shrinkWrap: true,
                                itemBuilder: (_, index){
                                  var userObj = historyList[index];
                                  return Column(
                                    children: [
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
                                          'Quantity :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        title: Text(userObj.b_quantity),
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
                                      SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Age Information',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          userObj.age,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        title: Text(
                                          'years',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        tileColor: MyColors.naturalLight,
                                      ),
                                      SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Reason',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          userObj.reason,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        tileColor: MyColors.naturalLight,
                                      ),
                                    ],
                                  );
                            },
                            );

                          },
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ).paddingAll(10),
      ).paddingAll(10),
    );
  }
}
