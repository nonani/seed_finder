import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:seed_finder/firebase_options.dart';
import 'package:seed_finder/providers/app_router_provider.dart';
import 'package:seed_finder/providers/secure_storage_provider.dart';
import 'package:seed_finder/utils/env.dart';
import 'package:seed_finder/utils/logger.dart';
import 'package:seed_finder/utils/provider_observer.dart';
import 'package:seed_finder/utils/theme.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  await loadEnv(); //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  _setupLocalNotifications();
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  final NotificationSettings settings = await messaging.requestPermission();
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    logger.d('User granted permission');
  } else {
    logger.d('User declined or has not accepted permission');
  }
  final fcmToken = await messaging.getToken();
  logger.d(fcmToken);

  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      if (message.notification != null) {
        final String title = message.notification!.title ?? 'No Title';
        final String body = message.notification!.body ?? 'No Body';

        // 로컬 알림 표시
        _showNotification(title, body);
      }
    },
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // Initialize date formatting with a specific locale
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);

  runApp(
    const ProviderScope(
      observers: [MainObserver()],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.read(storageProvider);
    storage.deleteAll();
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: theme,
    );
  }
}

Future<void> _setupLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> _showNotification(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id', // 채널 ID
    'your_channel_name', // 채널 이름
    importance: Importance.max,
    priority: Priority.high,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0, // 알림 ID
    title, // 알림 제목
    body, // 알림 내용
    platformChannelSpecifics, // 알림 세부 정보
  );
}
