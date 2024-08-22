class MemoryModel {
  final String id;
  final String imagePath;

  MemoryModel({required this.id, required this.imagePath});

  factory MemoryModel.fromMap(Map<String, dynamic> data, String id) {
    return MemoryModel(
      id: id,
      imagePath: data['imagePath'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
    };
  }
}