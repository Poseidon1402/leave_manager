import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/user_entity.dart';

class UserRepository {
  final _firestore = FirebaseFirestore.instance.collection('user');

  Future<UserEntity> getUserByEmail(String email) async {
    final doc = (await _firestore.where('email', isEqualTo: email).get()).docs.first;

    print(doc.data());
    return UserEntity.fromJson(doc.data());
  }
}