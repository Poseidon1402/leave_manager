import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/pause_entity.dart';

class PauseRepository {
  final _firestore = FirebaseFirestore.instance.collection('pauses');

  Future<void> insert(PauseEntity pause) async {
    await _firestore.add(pause.toJson());
  }
}