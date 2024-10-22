class Note {
  String id;
  String title;
  String content;
  String category; // Tambahkan kategori jika diperlukan

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
  });

  // Convert Note object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
    };
  }

  // Convert Map to Note object
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      category: map['category'],
    );
  }
}
