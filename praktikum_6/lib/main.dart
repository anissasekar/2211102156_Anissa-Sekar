import 'dart:async'; 
import 'package:flutter/material.dart'; 
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; 

void main() => runApp(MaterialApp( 
      theme: ThemeData( 
          appBarTheme: AppBarTheme( 
        color: Colors.amber, 
      )), 
      home: MyApp(), 
      debugShowCheckedModeBanner: false, 
    )); 

class MyApp extends StatefulWidget {
  const MyApp({super.key});
 
  @override 
  _MyAppState createState() => _MyAppState(); 
} 

class _MyAppState extends State<MyApp> { 
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override 
  void initState() { 
    super.initState(); 
    var initializationSettingsAndroid = 
        AndroidInitializationSettings('flutter_devs'); 
    var initializationSettingsIOS = IOSInitializationSettings(); 
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS); 

    flutterLocalNotificationsPlugin.initialize(initializationSettings, 
        onSelectNotification: onSelectNotification); 
  } 

  Future onSelectNotification(String? payload) { 
    if (payload != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) { 
        return NewScreen( 
          payload: payload, 
        ); 
      })); 
    }
    return Future.value();
  } 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Colors.amber, 
        title: Text('Flutter notification demo'), 
      ), 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            ElevatedButton( 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // background
              ), 
              onPressed: showNotification, 
              child: Text('showNotification'), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 

  Future<void> showNotification() async { 
    var androidDetails = AndroidNotificationDetails(
        'id', 'channel', 'description', 
        priority: Priority.high, importance: Importance.max); 
    var iOSDetails = IOSNotificationDetails(); 
    var platformDetails = NotificationDetails(android: androidDetails, iOS: iOSDetails); 

    await flutterLocalNotificationsPlugin.show(
        0, 
        'Flutter devs', 
        'Flutter Local Notification Demo', 
        platformDetails, 
        payload: 'Welcome to the Local Notification demo'); 
  } 
}

class NewScreen extends StatelessWidget { 
  final String payload; 

  const NewScreen({super.key, required this.payload}); 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text(payload), 
      ), 
    ); 
  } 
}
