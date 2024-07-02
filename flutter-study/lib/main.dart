import 'package:flutter/material.dart';
import 'package:flutter_application_1/locator/locator.dart';
import 'package:flutter_application_1/model/album.dart';
import 'package:flutter_application_1/service/album_service.dart';
void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetIt 테스트',
      home: TestView(),
    );
  }
}

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {

  final AlbumService _service = locator<AlbumService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get It 예제"),
      ),
      body: FutureBuilder(
        future: _service.fetchAlbums(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Album>? list = snapshot.data;
            return ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Text("${list?[index].id} : ${list?[index].title}"),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("error"),
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
        },
      ),
    );
  }
}