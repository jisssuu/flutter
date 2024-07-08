import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   final List tabUrlList = [
    "https://flutter.dev/multi-platform/mobile",
    "https://flutter.dev/multi-platform/web",
    "https://flutter.dev/multi-platform/desktop",
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: const Text("WebView"),
          bottom: const TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5, color: Colors.blue),
            ),
            labelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.phone_iphone)),
              Tab(icon: Icon(Icons.web)),
              Tab(icon: Icon(Icons.desktop_mac)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(tabUrlList[0]),
              ),
              gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
            ),
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(tabUrlList[1]),
              ),
              gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
            ),
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(tabUrlList[2]),
              ),
              gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
            ),
          ],
        ),
      ),
    );
  }
}