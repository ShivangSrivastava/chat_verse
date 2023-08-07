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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAKzFdV_A51uuwLF9XqkgFnK_lzLmZVGhc',
    appId: '1:467121059042:web:cd8495a9a26fbd0824dabb',
    messagingSenderId: '467121059042',
    projectId: 'chatverse-3995b',
    authDomain: 'chatverse-3995b.firebaseapp.com',
    storageBucket: 'chatverse-3995b.appspot.com',
    measurementId: 'G-4B9QMQ496T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASWUcPpG7es0GN3CBpl79yAZi-Wb7uMAw',
    appId: '1:467121059042:android:d8b06e04abb3d19024dabb',
    messagingSenderId: '467121059042',
    projectId: 'chatverse-3995b',
    storageBucket: 'chatverse-3995b.appspot.com',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyAKzFdV_A51uuwLF9XqkgFnK_lzLmZVGhc',
    appId: '1:467121059042:web:cd8495a9a26fbd0824dabb',
    messagingSenderId: '467121059042',
    projectId: 'chatverse-3995b',
    authDomain: 'chatverse-3995b.firebaseapp.com',
    storageBucket: 'chatverse-3995b.appspot.com',
    measurementId: 'G-4B9QMQ496T',
  );
}