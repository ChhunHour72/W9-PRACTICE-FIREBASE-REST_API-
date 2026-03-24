import '../../model/artists/artist.dart';

class ArtistDto {
  static const String nameKey = 'name';
  static const String genreKey = 'genre';
  static const String imageUrlKey = 'imageUrl';

  static Artist fromJson(Map<String, dynamic> json, {required String id}) {
    return Artist(
      id: id,                   
      name: json[nameKey],
      genre: json[genreKey],
      imageUrl: json[imageUrlKey],
    );
  }
}