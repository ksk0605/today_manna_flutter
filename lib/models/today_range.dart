class TodayRange {
  String date; // 날짜
  List<String> range; // 범위
  List<bool> isChecked; // 읽음 여부

  TodayRange({
    required this.date,
    required this.range,
    required this.isChecked,
  });

  factory TodayRange.fromJson(Map<String, dynamic> json) {
    return TodayRange(
        date: json['date'],
        range: json['range'].split(','),
        isChecked: List<bool>.filled(json['range'].split(',').length, false));
  }
}