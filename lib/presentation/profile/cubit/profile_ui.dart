class ProfileUI {
  final String name;
  final String email;
  final String phone;
  final String university;
  final String avatar;
  final ChartData chartData;

  ProfileUI({
    required this.name,
    required this.email,
    required this.phone,
    required this.university,
    required this.avatar,
    required this.chartData,
  });
}

class ChartData {
  final double ratio;
  final List<ChartDataItem> items;

  ChartData({
    required this.ratio,
    required this.items,
  });
}

class ChartDataItem {
  final String title;
  final double value;

  ChartDataItem({
    required this.title,
    required this.value,
  });
}
