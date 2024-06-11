class SejarahUmumModel {
  final int id;
  final String description;
  final String createdAt;
  final String updatedAt;

  SejarahUmumModel({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SejarahUmumModel.fromJson(Map<String, dynamic> json) {
    return SejarahUmumModel(
      id: json['id'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
