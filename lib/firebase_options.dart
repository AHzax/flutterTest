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
    apiKey: 'AIzaSyDMi0TsCrUyl54x7QjhUGnO69njLY976oM',
    appId: '1:433181507594:web:1c42f5e298995c33839ff3',
    messagingSenderId: '433181507594',
    projectId: 'flutterprac-74fb9',
    authDomain: 'flutterprac-74fb9.firebaseapp.com',
    storageBucket: 'flutterprac-74fb9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBe93jq_UxDfc2NYraBO-dDEcoAO-47Xjw',
    appId: '1:433181507594:android:f3ded873603679e5839ff3',
    messagingSenderId: '433181507594',
    projectId: 'flutterprac-74fb9',
    storageBucket: 'flutterprac-74fb9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtWi0UH1kwj9D8KF9KTDFFDZ_VVA5CBuo',
    appId: '1:433181507594:ios:acdc1cfc016baaa6839ff3',
    messagingSenderId: '433181507594',
    projectId: 'flutterprac-74fb9',
    storageBucket: 'flutterprac-74fb9.appspot.com',
    iosBundleId: 'com.example.docapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtWi0UH1kwj9D8KF9KTDFFDZ_VVA5CBuo',
    appId: '1:433181507594:ios:acdc1cfc016baaa6839ff3',
    messagingSenderId: '433181507594',
    projectId: 'flutterprac-74fb9',
    storageBucket: 'flutterprac-74fb9.appspot.com',
    iosBundleId: 'com.example.docapp',
  );
}