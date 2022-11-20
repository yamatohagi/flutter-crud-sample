import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> notify() {
  final flnp = FlutterLocalNotificationsPlugin();
  return flnp
      .initialize(
        const InitializationSettings(
          iOS: DarwinInitializationSettings(),
        ),
      )
      .then((_) => flnp.show(0, 'title', 'body', const NotificationDetails()));
}
