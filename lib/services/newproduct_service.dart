import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vmart/models/newproduct_model.dart';

Future<List<NewproductModel>> loadnewproduct() async {
  final String jsonString =
      await rootBundle.loadString("lib/assets/jsons/newproduct.json");
  final List<dynamic> jsonList = jsonDecode(jsonString);
  return jsonList.map((item) => NewproductModel.fromJson(item)).toList();
}
