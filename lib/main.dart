import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const AndroidInitializationSettings initializationSettingAndroid =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Local Notification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 Future<void> _showNotification() async{

const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
  'nextflow_noti_001','แจ้งเตือนทั่วไป',
  importance: Importance.max,
  priority: Priority.high,
  ticker: 'ticker'
);

const NotificationDetails platformChannelDetails = NotificationDetails(
  android: androidNotificationDetails,
);

await flutterLocalNotificationsPlugin.show(0, 'สวัสดี', 'new inform', platformChannelDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      _showNotification();
                    },
                    child: Text('TextButton'),
                  )),
            ],
          ),
        ));
  }
}
