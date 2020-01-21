import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationWidget extends StatefulWidget{
  @override
  _LocalNotificationWidgetState createState() => _LocalNotificationWidgetState();

}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  @override
  void initState(){
    super.initState();

    final settingAndroid = AndroidInitializationSettings('app_icon');
    final settingIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) =>
          onSelectNotification(payload));

      notification.initialize(
        InitializationSettings(settingAndroid,settingIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(context,

  MaterialPageRoute(builder: (context => SecondPage(payload: payload))),
  );

  @override
  Widget build(BuildContext context) => Container();
}


