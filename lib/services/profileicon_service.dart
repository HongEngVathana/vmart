import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/profileicon_model.dart';

Future<List<ProfileiconModel>> loadProfileIcons() async {
  final String jsonString =
      await rootBundle.loadString("lib/assets/jsons/profilepage.json");
  final List<dynamic> jsonList = jsonDecode(jsonString);

  return jsonList.map((item) => ProfileiconModel.fromJson(item)).toList();
}
