import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meui_project/utils/size_config.dart';
import 'package:meui_project/view/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return OrientationBuilder(
          builder: (BuildContext context2, Orientation orientation) {
        SizeConfig.init(constraints, orientation);

        return GetMaterialApp(
          title: "Meui Project",
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          defaultTransition:
              GetPlatform.isIOS ? Transition.cupertino : Transition.rightToLeft,
          home: const LoginScreen(),
        );
      });
    });
  }
}
