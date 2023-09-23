import 'dart:typed_data';

class Item {
  final String id;
  final String cover;
  final String title;
  final String subtitle;
  final Duration duration;
  final String song;

  Item({
    required String this.id,
    required String this.cover,
    required String this.title,
    required String this.subtitle,
    required this.duration,
    required this.song,
  });

  static where(Null Function(dynamic book) param0) {}

  contains(String param) {}
}
