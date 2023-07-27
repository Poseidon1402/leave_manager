import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/pause_entity.dart';

class PauseRepository {
  final _firestore = FirebaseFirestore.instance.collection('pauses');

  Future<void> insert(PauseEntity pause) async {
    await _firestore.add(pause.toJson());
  }

  Future<List<PauseEntity>> getAllPauses() async {
    final docs = (await _firestore.get()).docs;

    final List<PauseEntity> pauses = [];

    for (var doc in docs) {
      pauses.add(PauseEntity.fromJson(doc.id, doc.data()));
    }

    return pauses;
  }

  Future<void> updateStatus(String id, String status) async {
    await _firestore.doc(id).update({"status": status});
  }
}