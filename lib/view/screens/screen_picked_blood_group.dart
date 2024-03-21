import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blood_donate_app/view/screens/screen_home.dart';
import 'package:my_blood_donate_app/widgets/my_button.dart';
import '../../helpers/constants.dart';
import '../../helpers/firebase_helpers.dart';

class ScreenPickedBloodGroup extends StatelessWidget {
  List<String> choice = ['A', 'B', 'C', 'D'];
  var isSelected = false.obs;
  var choiceIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/Vector2.png'),
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Please Pick your blood type',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Don’t know about your blood type ?',
                    style: TextStyle(
                        color: MyColors.redColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 100),
                  Wrap(
                    children: List.generate(
                      choice.length,
                      (index) {
                        return Obx(
                          () {
                            return ChoiceChip(
                              backgroundColor: Colors.white,
                              label: Text(
                                choice[index],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              selected: choiceIndex == index,
                              onSelected: (value) {
                                choiceIndex.value = value ? index : 0;
                              },
                              shape: RoundedRectangleBorder(),
                              selectedColor: MyColors.redColor,
                              showCheckmark: false,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            MyButton(
              Text: Text(
                'Finish',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                DbConstants.usersRef.doc(AuthConstants.currentUserId).update(
                  {
                    'b_group': choiceIndex,
                  },
                );
                Get.to(ScreenHome());
              },
            ),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
