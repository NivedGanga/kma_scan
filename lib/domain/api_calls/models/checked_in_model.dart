class CheckedInModel {
  String name;
  String email;
  String transactionId;

  CheckedInModel({
    required this.name,
    required this.email,
    required this.transactionId,
  });

  factory CheckedInModel.fromJson(Map<String, dynamic> json) => CheckedInModel(
        name: json['name'],
        email: json['email'],
        transactionId: json['transaction_id'],
      );
}
