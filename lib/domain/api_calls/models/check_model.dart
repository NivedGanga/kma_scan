import 'dart:convert';

class CheckInModel {
  final String userEmail;
  final String userId;
  final String transactionId;

  CheckInModel({
    required this.userEmail,
    required this.userId,
    required this.transactionId,
  });
  factory CheckInModel.fromToken(String token) {
    token = token.replaceAll("'", '"');

    Map<String, dynamic> myMap = json.decode(token);

    String userEmail = myMap['user_email'];
    String userId = myMap['user_id'];
    String transactionId = myMap['transaction_id'];

    return CheckInModel(
      userEmail: userEmail,
      userId: userId,
      transactionId: transactionId,
    );
  }
  factory CheckInModel.fromJson(Map<String, dynamic> json) => CheckInModel(
        userEmail: json['user_email'],
        userId: json['user_id'],
        transactionId: json['transaction_id'],
      );
}
