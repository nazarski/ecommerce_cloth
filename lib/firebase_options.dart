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
    apiKey: 'AIzaSyC7T_bRyYUJWmmN827bUNBNp7E_fggXshk',
    appId: '1:377716233524:android:34476e52e8fd4bdfbd4161',
    messagingSenderId: '377716233524',
    projectId: 'lambda-new-ecom',
    storageBucket: 'lambda-new-ecom.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJQAkrgrldgg4LbYe5Wyf6Ocy0Qg0Ftmw',
    appId: '1:377716233524:ios:67eca861d23e0883bd4161',
    messagingSenderId: '377716233524',
    projectId: 'lambda-new-ecom',
    storageBucket: 'lambda-new-ecom.appspot.com',
    androidClientId: '377716233524-u2b8ocrq4s9kqqbjco18s2bqbpeub55i.apps.googleusercontent.com',
    iosClientId: '377716233524-jbf3dc71rd8cuiuj6oqe4ebv09r5q0nj.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceCloth',
  );
}
