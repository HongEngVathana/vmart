import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vmart/models/weeklyoffers_model.dart';

Future<List<WeeklyoffersModel>> loadweeklyoffers() async {
  final String jsonString =
      await rootBundle.loadString("lib/assets/jsons/weeklyoffers.json");
  final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
  final List<dynamic> jsonList = jsonResponse['data'];
  return jsonList.map((item) => WeeklyoffersModel.fromJson(item)).toList();
}
