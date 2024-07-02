import 'dart:convert';
import 'package:flutter_application_1/model/albums.dart';
import 'package:http/http.dart' show Client;

class AlbumApiProvider {
  Client client = Client();

  Future<Albums> fetchAlbumList() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1/albums'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Albums.fromJSON(data);
    } else {
      throw Exception('Failed');
    }
  }
}