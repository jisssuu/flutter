import 'package:flutter_application_1/model/albums.dart';
import 'package:flutter_application_1/repository/album_repository.dart';
import 'package:rxdart/subjects.dart';

class AlbumBloc {
  final AlbumRepository _albumRepository = AlbumRepository();
  final PublishSubject<Albums> _albumFetcher = PublishSubject<Albums>();
  
  Stream<Albums> get allAlbums => _albumFetcher.stream;

  Future<void> fetchAllAlbums() async {
    Albums albums = await _albumRepository.fetchAllAlbums();
    _albumFetcher.sink.add(albums);
  }
  dispose() {
    _albumFetcher.close();
  }
}