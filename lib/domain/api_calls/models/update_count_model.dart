class UpdateCountModel {
  UpdateCountModel({
    required this.name,
    required this.email,
    required this.totalCount,
    required this.currentCount,
    required this.transactionId,
    required this.id,
  });
  String name;
  String email;
  final int totalCount;
  final int currentCount;
  final String transactionId;
  final int id;
  factory UpdateCountModel.fromJson(Map<String, dynamic> json) =>
      UpdateCountModel(
        name: json['name'],
        email: json['email'],
        totalCount: json["totalCount"],
        currentCount: json["currentCount"],
        transactionId: json["transaction_id"],
        id: json["id"],
      );
}
