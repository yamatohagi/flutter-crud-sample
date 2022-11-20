import 'package:flutter/material.dart';
import 'package:front/view/organisms/bottom_tab.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  final docs = notify();
  


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //初期画面の設定
      title: 'お薬手帳一覧',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      routes: <String, WidgetBuilder>{
        '/': (_) => const BottomTab(),
      },
    );
  }
}


Future<void> notify() {
  final flnp = FlutterLocalNotificationsPlugin();
  dynamic androidNotificationDetails;
  dynamic iOSNotificationDetails;
  return flnp
      .initialize(
        const InitializationSettings(
          iOS: DarwinInitializationSettings(),
        ),
      )
      .then((_) => flnp.zonedSchedule(
            0,
            'title',
            'body',
            tz.TZDateTime.now(tz.UTC).add(const Duration(seconds: 10)),
            NotificationDetails(
              android: androidNotificationDetails,
              iOS: iOSNotificationDetails,
            ),
            androidAllowWhileIdle: true,
            uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
          ));
}
