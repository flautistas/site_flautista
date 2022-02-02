import 'package:flutter/material.dart';
import 'package:site_flautistas/app/constants/default_colors.dart';
import 'package:site_flautistas/app/pages/login_page/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site dos Flautistas ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: DefaultColors.blueNocturne,
        bottomAppBarColor: DefaultColors.blueNocturne,
        primarySwatch: Colors.lightBlue,
      ),
      home: const LoginPage(title: 'Flautistas Site'),
    );
  }
}
