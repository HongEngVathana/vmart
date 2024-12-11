import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vmart/models/purrfectly_model.dart';

Future<List<PurrfectlyModel>> loadPurrfectly() async {
  final String jsonString =
      await rootBundle.loadString("lib/assets/jsons/purrfectly.json");
  final List<dynamic> jsonList = jsonDecode(jsonString);
  return jsonList.map((item) => PurrfectlyModel.fromJson(item)).toList();
}
