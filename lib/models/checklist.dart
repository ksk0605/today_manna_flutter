import 'dart:convert';

import 'package:today_manna_flutter/models/today_range.dart';

class Checklist {
  final List<TodayRange>? checklist;

  Checklist({this.checklist});

  factory Checklist.fromJson(String jsonString) {
    List<dynamic> listFromJson = jsonDecode(jsonString);
    List<TodayRange> ranges = <TodayRange>[];

    ranges = listFromJson.map((range) => TodayRange.fromJson(range)).toList();
    return Checklist(checklist: ranges);
  }
}
