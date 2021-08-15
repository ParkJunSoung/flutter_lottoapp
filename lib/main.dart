import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lotto/ui/lotto_board.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('로또 대박기원'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: LottoBoard(),
        ),
      ),
    );
  }
}



