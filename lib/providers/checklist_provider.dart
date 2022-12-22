import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:today_manna_flutter/models/checklist.dart';
import 'package:today_manna_flutter/models/today_range.dart';

class ChecklistProvider extends ChangeNotifier {
  // 맥체인 체크리스트 목록 :
  List<TodayRange> checklist = [];

  Future<void> getChecklist() async {
    final routeFromjsonFile =
        await rootBundle.loadString('assets/jsons/mccheyne_ranges.json');
    checklist =
        Checklist.fromJson(routeFromjsonFile).checklist ?? <TodayRange>[];
    notifyListeners();
  }
}
