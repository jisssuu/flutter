import 'package:flutter_application_1/service/album_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

initLocator() {
  locator.registerLazySingleton<AlbumService>(() => AlbumServiceImplementation());
}
