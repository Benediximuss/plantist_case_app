import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String email;

  UserModel({
    required this.id,
    required this.email,
  });

  factory UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    return UserModel(
      id: documentSnapshot.id,
      email: documentSnapshot["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
