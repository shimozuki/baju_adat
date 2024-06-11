class About_Model {
  final int id;
  final String description;
  final String createdAt;
  final String updatedAt;

  About_Model({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory About_Model.fromJson(Map<String, dynamic> json) {
    return About_Model(
      id: json['id'] ?? 0,
      description: json['description'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
