import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vmart/models/backtoschool_model.dart';

Future<List<BacktoschoolModel>> loadbacktoschool() async {
  final String jsonString =
      await rootBundle.loadString("lib/assets/jsons/boxeddeals.json");
  final List<dynamic> jsonList = jsonDecode(jsonString);
  return jsonList.map((item) => BacktoschoolModel.fromJson(item)).toList();
}
