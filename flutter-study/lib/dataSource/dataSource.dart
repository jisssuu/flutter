import 'dart:convert';

import 'package:flutter_application_1/model/album.dart';
import 'package:http/http.dart' as http;

class DataSource {
  Future<List<Album>> getAlbumList() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/1/albums"));

    return jsonDecode(response.body).map<Album>((json) => Album.fromJson(json)).toList();
  }
}