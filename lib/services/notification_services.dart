import '../constant/app_imports.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifyHelper {
   ///******************** Object Of Package Notification ********************///
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void Function(NotificationResponse notificationResponse)? onTap;

  ///******************** Initialize Notification ********************///
  static Future init() async {
    tz.initializeTimeZones();
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    Get.dialog(Text(body!));
  }

  ///******************** Show Basic Notification ********************///
  static void showBasicNotification({
    required String title,
    required String body,
    required int id,
  }) async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        id.toString(),
        body,
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(id, title, body, details);
  }

  ///******************** Show Repeated Notification ********************///
  static void showRepeatedNotification({
    required String title,
    required String body,
    required int id,
  }) async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        id.toString(),
        body,
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, RepeatInterval.everyMinute, details);
  }

  ///******************** Show Scheduled Notification ********************///
  static void showScheduledNotification({
    required String title,
    required String body,
    required int id,
  }) async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        id.toString(),
        title,
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)), details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  ///******************** Select Notification ********************///
  Future selectNotification(String payload) async {
    if (payload == null) {
      debugPrint("Notification paylod ${payload}");
    }
    Get.toNamed(AppStrings.notificationRoute, arguments: payload);
  }

  ///******************** Cansel Notification with id ********************///
  static void canselNotification({required int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
