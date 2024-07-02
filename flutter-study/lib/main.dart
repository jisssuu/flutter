import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/album_provider.dart';
import 'package:flutter_application_1/view/album_view.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AlbumProvider>(
        create: (context) => AlbumProvider(), child: const AlbumView(),
      ),
    );
  }
}

