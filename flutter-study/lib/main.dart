import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter_image_saver/flutter_image_saver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: const TestView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  final repaintBoundary = GlobalKey();

  void save() async {
    final boundary = repaintBoundary.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 2);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final path = await saveImage(byteData!.buffer.asUint8List(),'flutter.png' );
    final message = path.isEmpty ? "Saved" : "Saved to $path";
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        centerTitle: true,
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: save,
        child: const Icon(Icons.download),
      ),
      body: RepaintBoundary(
        key: repaintBoundary,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Text("제목 1", style: TextStyle(fontSize: 24),),
                Text('제목1-1'),
                Text('제목1-2'),
                Container(
        
                  width: 200,
                  height: 200,
                  color: Colors.green,
                ),Text("제목 2", style: TextStyle(fontSize: 24),),
                Text('제목2-1'),
                Text('제목2-2'),
                Container(
        
                  width: 200,
                  height: 200,
                  color: Colors.purple,
                ),
        
              ]
            ),
          ),
        ),
      ),
    );
  }

  
}