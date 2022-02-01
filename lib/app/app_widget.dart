import 'package:flutter/material.dart';
import 'package:site_flautistas/app/pages/game_add/game_add_page.dart';

import 'pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site dos Flautistas ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flautistas Site'),
      //home: const GameAddAPage(),
    );
  }
}
