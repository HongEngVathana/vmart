import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/categorie_model.dart';

Future<List<Category>> loadCategories() async {
  final String jsonString =
      await rootBundle.loadString("lib/assets/jsons/categories.json");
  final List<dynamic> jsonList = jsonDecode(jsonString);

  return jsonList.map((item) => Category.fromJson(item)).toList();
}
