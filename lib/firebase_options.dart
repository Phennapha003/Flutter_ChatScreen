// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, depend_on_referenced_packages
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDsga8HM00-nfZ529UAIMxFpZPuWkIoCsA',
    appId: '1:935953235854:web:779e11a2d84109b5b3eedf',
    messagingSenderId: '935953235854',
    projectId: 'paperrocketchat-218d0',
    authDomain: 'paperrocketchat-218d0.firebaseapp.com',
    storageBucket: 'paperrocketchat-218d0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXBHPxY1IzYP7Vqib_RA4nUGnNxLmu6fU',
    appId: '1:935953235854:android:2ab379dd2174d808b3eedf',
    messagingSenderId: '935953235854',
    projectId: 'paperrocketchat-218d0',
    storageBucket: 'paperrocketchat-218d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDQcsWcl65T4MILLphKMy-VE0-LvL8utY',
    appId: '1:935953235854:ios:953a83b2da48581eb3eedf',
    messagingSenderId: '935953235854',
    projectId: 'paperrocketchat-218d0',
    storageBucket: 'paperrocketchat-218d0.appspot.com',
    iosClientId:
        '935953235854-9cqj7idh6cnq6bqigudprr5k1a4q8g5s.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplicationW8',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDQcsWcl65T4MILLphKMy-VE0-LvL8utY',
    appId: '1:935953235854:ios:38f565098fb5fb52b3eedf',
    messagingSenderId: '935953235854',
    projectId: 'paperrocketchat-218d0',
    storageBucket: 'paperrocketchat-218d0.appspot.com',
    iosClientId:
        '935953235854-dtgb8kks6bbq70i5thcmeutrtfmr61nn.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplicationW8.RunnerTests',
  );
}