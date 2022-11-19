import 'package:flutter/material.dart';
import 'package:front/view/cat_list.dart';
// import 'package:front/view/api_test_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //初期画面の設定
      title: '猫一覧',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (_) => const CatList(), //cat_list.dartを呼び出し
      },
    );
  }
}
