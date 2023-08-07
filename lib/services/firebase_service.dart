import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  String uid;
  FirestoreService({required this.uid});
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future addInfo({required String email}) {
    return users.doc(uid).set({
      'uid': uid,
      'name': '',
      'surName': '',
      'dob': '',
      'Home address': '',
      'phoneNumber': '',
      'bvn': '',
      'email': email,
      'pin': ''
    });
  }

  Future updateInfo2({
    required String name,
    required String surName,
    required String phoneNumber,
    required String dob,
    required String homeAddress,
    required String bvn,
  }) {
    return users.doc(uid).update({
      'name': name,
      'surName': surName,
      'dob': dob,
      'Home address': homeAddress,
      'phoneNumber': phoneNumber,
      'bvn': bvn,
    });
  }

  Future updateInfo1({
    required String pin,
  }) {
    return users.doc(uid).update({
      'pin': pin,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot = await users.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
