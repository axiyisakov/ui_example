/*
Created by Axmadjon Isaqov on 09:09:21 14.09.2022
© 2022 @axi_dev 
*/

/*
Mavzu:::Login UI
*/
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesson_g/page/amazon/amazon_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: DevicePreview.locale(context),
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black)),
          backgroundColor: Colors.black),
      home: const AmazonView(),
    );
  }
}
