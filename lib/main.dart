import 'package:api_crud_project/Pages/productCreate_page.dart';
import 'package:api_crud_project/Pages/productGriviewPage.dart';
import 'package:api_crud_project/Style/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Api crud operation',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ProductGridViewScreen()
    );
  }
}

