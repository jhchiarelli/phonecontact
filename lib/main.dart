import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:phonecontact/main_bindings.dart';
import 'package:phonecontact/src/views/home/bindings/home_binding.dart';
import 'package:phonecontact/src/views/home/pages/home_page.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor:
          Color(0xFF3c0276), // status de cor da barra superiorBarIconBrightness
    ),
  );
  runApp(GetMaterialApp(
    title: "Phone Contacts",
    theme: ThemeData(
      primaryColorDark: Color(0xFF3c0276),
      primaryColor: Color(0xFF241DF2),
      primarySwatch: Colors.blue,
      accentColor: Color(0xFF1184F9),
      hintColor: Color(0xFF0F3EDB),
    ),
    enableLog: false,
    debugShowCheckedModeBanner: false,
    initialBinding: MainBindings(),
    initialRoute: "/",
    defaultTransition: Transition.fade,
    getPages: [
      GetPage(
        name: "/",
        page: () => HomePage(),
        binding: HomeBindig(),
      ),
    ],
  ));
}
