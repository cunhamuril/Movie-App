import 'package:movie_app/config/api.dart';

class Cast {
  final String? profileImagePath;
  final String name;
  final String character;

  Cast({
    required this.name,
    required this.character,
    this.profileImagePath,
  });

  Cast.fromJson(Map<String, dynamic> json)
      : profileImagePath = json['profile_path'] != null
            ? API_IMAGE_BASE_URL + json['profile_path']
            : null,
        name = json['name'],
        character = json['character'];

  @override
  String toString() {
    return 'Genre {name: $name, character: $character}';
  }
}
