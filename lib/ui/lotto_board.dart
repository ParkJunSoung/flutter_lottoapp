
import 'dart:math';

import 'package:flutter/material.dart';

class LottoBoard extends StatefulWidget {
  @override
  State createState() {
    return LottoBoardState();
  }
}


class LottoBoardState extends State<LottoBoard> {
  final int min = 1;
  final int max = 45;

  List lottoNumbers =  [];
  var nums = Set();

  // 로또 번호 생성
  var rng = new Random();

  void addLottoNumber() {
    resetLottoNumber();
    while (true) {
      var num = min + rng.nextInt(max - min);
      if (nums.add(num.toString())) {
        if (nums.length == 6) {
          break;
        }
      }
    }
    lottoNumbers = getLottoNumber();
  }

  void resetLottoNumber() {
    lottoNumbers.clear();
    nums.clear();
  }

  List<Text> getLottoNumber() {
    return nums.map((text) => Text(text, style: TextStyle(color: Colors.blue),))
        .toList();
    //return lottoNumbers.map((text) => Text(text, style: TextStyle(color: Colors.blue),)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              "이번주 로또 번호는?",
              textAlign: TextAlign.center,
              //style: TextStyle( )
            ),
          ),
        ),
        Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisCount: 6,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              children: List.generate(lottoNumbers.length, (index) {
                return Column(
                  children: <Widget>[
                    lottoNumbers[index],
                  ],
                );
              }),
            )
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              makeButton('로또 번호 출력', addLottoNumber),
              makeButton('초기화', resetLottoNumber)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ],
    );
  }
  Widget makeButton(String title, VoidCallback callback) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        primary: Colors.red,
        ),
      child: Text(title),
      onPressed: () {
        setState(() {
          callback();
        });
      },
    );
  }
}
