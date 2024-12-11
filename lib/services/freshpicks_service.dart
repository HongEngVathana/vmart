import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vmart/models/boxeddeals.dart';

Future<List<Boxeddeals>> loadFreshPicks() async {
  final String jsonString =
      await rootBundle.loadString("lib/assets/jsons/freshpicks.json");
  final List<dynamic> jsonList = jsonDecode(jsonString);
  return jsonList.map((item) => Boxeddeals.fromJson(item)).toList();
}
