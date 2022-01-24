import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'app/constants/default_firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.firebaseConfig,
  );
  runApp(const AppWidget());
}
