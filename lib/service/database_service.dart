import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cnc_shop/model/user_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

  Future<void> createUserFromModel({required User user}) async {
    final docUser = _firebaseStore.collection('users').doc(user.uid);
    final Map<String, dynamic> userInfo = user.toMap();
    await docUser.set(userInfo);
  }

  Future<User?> getUserFromUid({required uid}) async {
    final docUser = _firebaseStore.collection('users').doc(uid);
    final snapshot = await docUser.get();

    if (!snapshot.exists) return null;

    final userInfo = snapshot.data();
    final user = User.fromMap(userMap: userInfo!);
    return user;
  }

  Future<void> updateUserFromUid({required uid, required User user}) async {}
}
