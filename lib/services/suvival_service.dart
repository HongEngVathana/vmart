import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vmart/models/survival_model.dart';

Future<List<SurvivalModel>> loadSurvivalItems() async {
  final String jsonString =
      await rootBundle.loadString("lib/assets/jsons/survivalessentials.json");
  final List<dynamic> jsonList = jsonDecode(jsonString);

  return jsonList.map((item) => SurvivalModel.fromJson(item)).toList();
}
