import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vmart/models/categorieslist_model.dart';

Future<List<CategorieslistModel>> loadCategorielists() async {
  final String jsonString =
      await rootBundle.loadString("lib/assets/jsons/categories_list.json");
  final List<dynamic> jsonList = jsonDecode(jsonString);

  return jsonList.map((item) => CategorieslistModel.fromJson(item)).toList();
}
