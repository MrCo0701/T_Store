import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // * Widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // * GetX local storage
  await GetStorage.init(); // ? ==> Build storage

  // * Await Splash until other items Load
  FlutterNativeSplash.preserve(
      widgetsBinding:
          widgetsBinding); // ? ==> Hold splash screen to wait the app is built

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const App());
}