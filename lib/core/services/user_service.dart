import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class UserService {
  UserService._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<UserModel?> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) return null;

    final doc = await _firestore.collection('users').doc(user.uid).get();

    if (!doc.exists) return null;

    return UserModel.fromMap(doc.id, doc.data()!);
  }
}
