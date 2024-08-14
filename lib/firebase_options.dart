// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDgvwHVRRTULF9F6gi-edAZmrTO24NBNiI',
    appId: '1:114054138220:web:cd3c9513cfce5da7d1cb49',
    messagingSenderId: '114054138220',
    projectId: 'ecommerceapp-5c472',
    authDomain: 'ecommerceapp-5c472.firebaseapp.com',
    storageBucket: 'ecommerceapp-5c472.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDc01Jci_EAJHmYBj-CJGIZJ8g3uXncx7g',
    appId: '1:114054138220:android:9733b5d5d00a28f6d1cb49',
    messagingSenderId: '114054138220',
    projectId: 'ecommerceapp-5c472',
    storageBucket: 'ecommerceapp-5c472.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiAQuqPPrdpzb1Jg5npiCPmUEj7PHFqPU',
    appId: '1:114054138220:ios:c6ad6ae1e3147767d1cb49',
    messagingSenderId: '114054138220',
    projectId: 'ecommerceapp-5c472',
    storageBucket: 'ecommerceapp-5c472.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiAQuqPPrdpzb1Jg5npiCPmUEj7PHFqPU',
    appId: '1:114054138220:ios:c6ad6ae1e3147767d1cb49',
    messagingSenderId: '114054138220',
    projectId: 'ecommerceapp-5c472',
    storageBucket: 'ecommerceapp-5c472.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDgvwHVRRTULF9F6gi-edAZmrTO24NBNiI',
    appId: '1:114054138220:web:cddfbd39114e6989d1cb49',
    messagingSenderId: '114054138220',
    projectId: 'ecommerceapp-5c472',
    authDomain: 'ecommerceapp-5c472.firebaseapp.com',
    storageBucket: 'ecommerceapp-5c472.appspot.com',
  );
}
