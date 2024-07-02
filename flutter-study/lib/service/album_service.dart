import 'dart:convert';
import 'package:flutter_application_1/model/album.dart';
import 'package:http/http.dart' as http;

abstract class AlbumService {
  Future<List<Album>> fetchAlbums();
}

class AlbumServiceImplementation implements AlbumService {
  @override
  Future<List<Album>> fetchAlbums() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/1/albums"));
    final List<Album> result = jsonDecode(response.body).map<Album>((json) => Album.fromJson(json)).toList();
    return result;
   }
}