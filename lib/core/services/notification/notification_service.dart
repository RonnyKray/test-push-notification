part of '../services_part.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  'test-push-notification',
  'Channel of Test Push Notification',
  channelDescription: 'This is app for test push notifications',
  importance: Importance.max,
  priority: Priority.high,
);

class NotificationService {
  NotificationService._internal();
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  String? _fcmToken;

  Future<void> initialize() async {
    const AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings =
        InitializationSettings(android: initSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initSettings);
    
    _fcmToken = await _messaging.getToken();
    print('FCM Token: $_fcmToken');
    
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground notification received: ${message.messageId}');
      _showNotification(message);
    });
    
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  
  Future<void> _showNotification(RemoteMessage message) async {
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'Новое уведомление',
      message.notification?.body ?? 'Получено новое уведомление',
      notificationDetails,
    );
  }

  String? get currentToken => _fcmToken;
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  const AndroidInitializationSettings initSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initSettings =
      InitializationSettings(android: initSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initSettings);
  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title ?? 'Новое уведомление',
    message.notification?.body ?? 'Получено новое уведомление',
    notificationDetails,
  );

  print('Background notification shown: ${message.messageId}');
}
