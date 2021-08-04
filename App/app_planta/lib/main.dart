import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Interface.dart';
import 'Set_humidity.dart';
import 'alerts_setting.dart';
import 'graph.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Horta',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainTabBar(title: 'Minha Horta'),
    );
  }
}

class MainTabBar extends StatelessWidget {
  const MainTabBar({key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.notifications_rounded),
              ),
              Tab(
                icon: Icon(Icons.miscellaneous_services_outlined),
              ),
              Tab(
                icon: Icon(Icons.trending_up_outlined),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            
            SetAlarms(key: Key("alarmes"), title: "alarmes",),
            SetHumidity(key: Key("humidade"), title: "humidade  ",),
            
            Graphs(getHumidity())
          ],
        ),
      ),
    );
  }
}