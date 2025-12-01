class MonthData {
  final String month;
  final int weight;

  MonthData({required this.month, required this.weight});
}

class MonthDataList {
  final List<MonthData> monthDataList;

  MonthDataList({required this.monthDataList});
}

MonthDataList monthDataList = MonthDataList(
  monthDataList: [
    MonthData(month: 'Jan', weight: 100),
    MonthData(month: 'Fev', weight: 92),
    MonthData(month: 'Mar', weight: 90),
    MonthData(month: 'Abr', weight: 88),
    MonthData(month: 'Mai', weight: 86),
    MonthData(month: 'Jun', weight: 84),
  ],
);