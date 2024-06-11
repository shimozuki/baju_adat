class Music {
  final int id;
  final String userId;
  final String namaAlat;
  final String link;
  final String sejarah;
  final String image;
  final String perawatan;
  final String tutorial;
  final String pembuatan;
  final String status;
  final String createdAt;
  final String updatedAt;
  final Author author;

  Music({
    required this.id,
    required this.userId,
    required this.namaAlat,
    required this.link,
    required this.sejarah,
    required this.image,
    required this.perawatan,
    required this.tutorial,
    required this.pembuatan,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      id: json['id'],
      userId: json['user_id'],
      namaAlat: json['nama_alat'],
      link: json['link'],
      sejarah: json['sejarah'],
      image: json['image'],
      perawatan: json['perawatan'],
      tutorial: json['tutorial'],
      pembuatan: json['pembuatan'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      author: Author.fromJson(json['author']),
    );
  }
}

class Author {
  final String name;
  final String whatsapp;
  final String email;

  Author({
    required this.name,
    required this.whatsapp,
    required this.email,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'],
      whatsapp: json['whatsapp'],
      email: json['email'],
    );
  }
}
