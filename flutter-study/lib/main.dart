import "package:flutter/material.dart";
import "package:flutter_application_1/view/albumView.dart";
import "package:flutter_application_1/viewModel/albumViewModel.dart";
import "package:provider/provider.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AlbumViewModel>(
        create: (context) => AlbumViewModel(),
        child: const AlbumView(),
      ),
    );
  }
}