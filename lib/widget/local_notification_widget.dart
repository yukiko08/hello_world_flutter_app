import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hello_world_flutter_app/page/second_page.dart';

class LocalNotificationWidget extends StatefulWidget{
  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();

}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notification = FlutterLocalNotificationsPlugin();

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

  MaterialPageRoute(builder: (context) => SecondPage(payload: payload)),
  );

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child:ListView(
      children: <Widget>[
        title('Basics'),
        RaisedButton(
          child: Text('show notification'),
          onPressed: () => showOngoingNotification(notifications,
          title: 'Title', body: 'Body'),
        ),
      ],
    )

  );

  Widget title(String text) => Container(
    margin: EdgeInsets.symmetric(vertical: 4),
    child: Text(
      text,
      style: Theme.of(context).textTheme.title,
      textAlign: TextAlign.center,
    ),
  );

}


