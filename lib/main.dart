import 'package:flutter/material.dart';
import 'package:flutter_01/HomePage.dart';
import 'package:flutter_01/Menu/Lost.dart';
import 'package:flutter_01/Menu/News.dart';
import 'package:flutter_01/Menu/Service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFU CarApp Demo EMNA',
      theme: ThemeData(
        primarySwatch: Colors.blue, //主題顏色
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'NFU EMNA CarApp Demo'), //app主畫面(app標題)
      routes: <String,WidgetBuilder>{ //畫面標籤
        '/News':(_) => new News(),
        '/Lost':(_) => new Lost(),
        '/Service':(_) => new Service(),
      },
    );
  }
}