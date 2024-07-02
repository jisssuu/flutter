import 'package:flutter_application_1/data_provider/api_provider.dart';
import 'package:flutter_application_1/model/albums.dart';

class AlbumRepository {
  final AlbumApiProvider _albumApiProvider = AlbumApiProvider();

  Future<Albums> fetchAllAlbums() async => _albumApiProvider.fetchAlbumList();
}