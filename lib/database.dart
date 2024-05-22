import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await _firestore.collection('users').doc(id).set(userInfoMap);
  }

  Future<void> updateUserWallet(String id, String amount) async {
    return await _firestore.collection('users').doc(id).update({"Wallet": amount});
  }
  Future<void> addFoodItem(Map<String, dynamic> userInfoMap, String id) async {
    return await _firestore.collection('name').doc(id).set(userInfoMap);
  }
  Future <Stream<QuerySnapshot>> getFoodItem(String name)async
  {
    return await _firestore.collection (name).snapshots();
  }
}

