import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/memory_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MemoryModel>> getMemories() async {
    final snapshot = await _firestore.collection('memories').get();
    return snapshot.docs
        .map((doc) => MemoryModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addMemory(MemoryModel memory) async {
    await _firestore.collection('memories').add(memory.toMap());
  }
}
