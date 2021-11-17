import 'package:flutter/material.dart';
import 'package:shualedurialeksandrezakradze/screen/addscreen.dart';
import 'package:shualedurialeksandrezakradze/screen/detailmarketscreen.dart';
import 'package:shualedurialeksandrezakradze/screen/editscreen.dart';
import 'package:shualedurialeksandrezakradze/screen/homescreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override Widget build(BuildContext context)
  {return MaterialApp(
      title: 'Clothes Market Application',
      theme: ThemeData(elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.cyan),
              ))),
      home: homescreen(),
      routes: {
        clothesdetailsscreen.routeName:(ctx)=>clothesdetailsscreen(),
        addclothesscreen.routeName:(ctx)=>addclothesscreen(),
        editclothesscreen.routeName:(ctx)=>editclothesscreen(),
      },
    );
  }
}