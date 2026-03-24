import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/artists/artist.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https(
    'w9-database-51342-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',  
  );

  @override
  Future<List<Artist>> fetchArtists() async {
    final response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      Map<String, dynamic> artistMap = json.decode(response.body);
      return artistMap.entries.map((entry) {
        return ArtistDto.fromJson(entry.value, id: entry.key);
      }).toList();
    } else {
      throw Exception('Failed to load artists');
    }
  }
}