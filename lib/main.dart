import 'package:ecommerce_cloth/firebase_options.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/restart_app.dart';
import 'package:ecommerce_cloth/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/resources/app_themes.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(
    name: 'ecommerce-cloth',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  runApp(
    const RestartWidget(
      child: ECommerceApp(),
    ),
  );
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

