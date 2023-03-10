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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUIT9IXfvETjzEWVUIsCePOSFGXNUVdgY',
    appId: '1:509954020806:android:157743ecccbda161b60ec7',
    messagingSenderId: '509954020806',
    projectId: 'tickly-b339e',
    databaseURL: 'https://tickly-b339e-default-rtdb.europe-west1.firebasedatabase.app/',
    storageBucket: 'tickly-b339e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-F_14Br6D1a1tMjViOppwwT96MJ6ktXU',
    appId: '1:509954020806:ios:34c1f95707528a20b60ec7',
    messagingSenderId: '509954020806',
    projectId: 'tickly-b339e',
    databaseURL: 'https://tickly-b339e-default-rtdb.europe-west1.firebasedatabase.app/',
    storageBucket: 'tickly-b339e.appspot.com',
    iosClientId: '509954020806-tfi2av43cbm9cqhtptg5ol45epea2g0u.apps.googleusercontent.com',
    iosBundleId: 'com.example.tickly',
  );
}
