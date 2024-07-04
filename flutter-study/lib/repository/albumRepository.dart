import 'package:flutter_application_1/dataSource/dataSource.dart';
import 'package:flutter_application_1/model/album.dart';

class AlbumRepository {
  final DataSource _dataSource = DataSource();

  Future<List<Album>> getAlbumList() {
    return _dataSource.getAlbumList();
  }
}