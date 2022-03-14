import 'package:flutter/material.dart';
import 'package:kevin_pretest4v3/parcel_app_theme.dart';
import 'package:kevin_pretest4v3/ui/screens/parcel_center_screen.dart';
import 'widgets/my_bottom_navigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ParcelAppTheme.LightTheme,
      home: Scaffold(
        body: ParcelCenterScreen(),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
