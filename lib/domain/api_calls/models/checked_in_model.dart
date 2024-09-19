class CheckedInModel {
  String name;
  String email;
  String transactionId;
  int totalCount;
  int currentCount;
  CheckedInModel({
    required this.name,
    required this.email,
    required this.transactionId,
    required this.totalCount,
    required this.currentCount,
  });

  factory CheckedInModel.fromJson(Map<String, dynamic> json) => CheckedInModel(
        name: json['name'],
        email: json['email'],
        transactionId: json['transaction_id'],
        totalCount: json['totalCount'],
        currentCount: json['currentCount'],
      );
}
