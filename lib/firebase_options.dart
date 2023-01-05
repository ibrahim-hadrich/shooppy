// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyD1K78_hTqXtiJsz-2eZvxbp4ZMaqm8xzM',
    appId: '1:4772398950:web:6263cf7fd6d7327376aaa7',
    messagingSenderId: '4772398950',
    projectId: 'shoppy-1d1a6',
    authDomain: 'shoppy-1d1a6.firebaseapp.com',
    storageBucket: 'shoppy-1d1a6.appspot.com',
    measurementId: 'G-4CJYCJP28B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHMCzkJ5ag_KJDj6szmrzKakk9fhvQ2xo',
    appId: '1:4772398950:android:4f4cca77cbdaf29d76aaa7',
    messagingSenderId: '4772398950',
    projectId: 'shoppy-1d1a6',
    storageBucket: 'shoppy-1d1a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcCBhrJaupEPqsW6qxh65XK8SkKdf2Ydo',
    appId: '1:4772398950:ios:a8caf7c6b8b4727876aaa7',
    messagingSenderId: '4772398950',
    projectId: 'shoppy-1d1a6',
    storageBucket: 'shoppy-1d1a6.appspot.com',
    iosClientId: '4772398950-r3phstmpmhgj60b5s8nq4t02tdmsp0j6.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDelivery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcCBhrJaupEPqsW6qxh65XK8SkKdf2Ydo',
    appId: '1:4772398950:ios:a8caf7c6b8b4727876aaa7',
    messagingSenderId: '4772398950',
    projectId: 'shoppy-1d1a6',
    storageBucket: 'shoppy-1d1a6.appspot.com',
    iosClientId: '4772398950-r3phstmpmhgj60b5s8nq4t02tdmsp0j6.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDelivery',
  );
}
