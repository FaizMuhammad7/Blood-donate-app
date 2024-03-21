import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blood_donate_app/view/screens/screen_home.dart';
import 'package:my_blood_donate_app/view/screens/screen_picked_blood_group.dart';
import 'package:my_blood_donate_app/view/screens/screen_started.dart';
import 'firebase_options.dart';
import 'helpers/constants.dart';
import 'helpers/firebase_helpers.dart';


void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.redColor),
        useMaterial3: true,
      ),
      home: AuthConstants.currentUser == null ?  ScreenStarted(): ScreenHome(),
      // home: ScreenPickedBloodGroup(),
      debugShowCheckedModeBanner: false,
    );
  }
}


