import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare/Models/User.dart';

class Database{

  final Firestore _firestore = Firestore.instance;

  Future<User> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
      await _firestore.collection("Users").document(uid).get();

      return User.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}