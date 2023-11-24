import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC5xImImz6FQU2I6K7TL9e3sC2Eml_HcQ0",
            authDomain: "pokemon-database-eb613.firebaseapp.com",
            projectId: "pokemon-database-eb613",
            storageBucket: "pokemon-database-eb613.appspot.com",
            messagingSenderId: "100044858041",
            appId: "1:100044858041:web:a220b25f16494efc417168"));
  } else {
    await Firebase.initializeApp();
  }
}
