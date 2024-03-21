import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/controllers/email_verification_controller.dart';
import 'package:my_blood_donate_app/helpers/firebase_helpers.dart';
import 'package:my_blood_donate_app/view/screens/screen_add_history.dart';
import 'package:my_blood_donate_app/view/screens/screen_history_more_information.dart';
import 'package:my_blood_donate_app/view/screens/screen_profile.dart';
import '../../helpers/constants.dart';
import '../../models/receiver_model.dart';

class ScreenHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () { Get.to(ScreenProfile());},
                      child: Text('Profile'),
                  ),
              ),
              Row(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'History',
                        style: TextStyle(
                            color: MyColors.redColor,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 16,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(ScreenAddHistory());
                      },
                      child: Icon(
                        Icons.add,
                        size: 14,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: MyColors.redColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.2),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search history...',
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
              StreamBuilder<QuerySnapshot>(
                stream: DbConstants.receiverRef.where('user_id',
                        isEqualTo: AuthConstants.currentUserId).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: SizedBox(
                      height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: MyColors.redColor,
                        ),
                    ),
                    );
                  }

                  var result = snapshot.data;
                  if (result == null) {
                    return Center(
                      child: Text("No data"),
                    );
                  }

                  var docs = result.docs;
                  var historyList = docs.map(
                        (e) {
                          return ReceiverModel.
                          fromMap(e.data() as Map<String, dynamic>);
                        },).toList();

                  return ListView.builder(
                    itemCount: historyList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = historyList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 17,
                          child: Image(
                            image: AssetImage('assets/images/Vector.png'),
                            height: 20,
                            width: 20,
                          ),
                          backgroundColor: MyColors.redColor,
                        ),
                        title: Text(item.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(item.b_quantity),
                        trailing: ElevatedButton(
                          onPressed: () {
                            Get.to(ScreenHistoryMoreInformation());
                          },
                          child: Text(
                            'Open Details',
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.naturalLight,
                            fixedSize: Size(95, 18)
                          ),
                        ),
                        tileColor: MyColors.naturalLight,
                      );
                    },
                  );
                },
              ),
            ],
          ).paddingAll(10),
        ),
      ),
    );
  }
}

