class CheckInCountModel {
  final int totalCountCheckIn;
  final int totalRegistered;
  CheckInCountModel(
      {required this.totalCountCheckIn, required this.totalRegistered});
  factory CheckInCountModel.fromJson(Map<String, dynamic> json) {
    return CheckInCountModel(
      totalCountCheckIn: json['total_count_checkin'],
      totalRegistered: json['total_registered'],
    );
  }
}
