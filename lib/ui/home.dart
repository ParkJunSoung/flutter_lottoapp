import 'package:flutter/material.dart';
import 'package:flutter_lotto/lotto_data/provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var list = context.read<MovieInfo>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${list.result.drwtNo1}'),
      ),
      body: Container(
      ),
    );
  }
}
