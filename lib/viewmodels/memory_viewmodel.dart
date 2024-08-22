import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/memory_model.dart';
import '../services/firebase_service.dart';

class MemoryViewModel extends ChangeNotifier {
  final List<MemoryModel> _memories = [];
  final ImagePicker _picker = ImagePicker();
  final FirebaseService _firebaseService = FirebaseService();

  List<MemoryModel> get memories => _memories;

  Future<void> fetchMemories() async {
    _memories.clear();
    _memories.addAll(await _firebaseService.getMemories());
    notifyListeners();
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final memory = MemoryModel(id: '', imagePath: image.path);
      await _firebaseService.addMemory(memory);
      _memories.add(memory);
      notifyListeners();
    }
  }
}
