import 'package:flutter/material.dart';
import 'package:flutter_lotto/lotto_data/lotto_datas.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class MovieInfo extends ChangeNotifier {
  final controller = TextEditingController();
  Lotto _result;

  Lotto get result => _result;

  Future<Lotto> fetchData() async {
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1');
    var response = await http.get(uri);
    Lotto result = Lotto.fromJson(json.decode(response.body));
    this._result = result;
    notifyListeners();
  }
}