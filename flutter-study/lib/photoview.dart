import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatefulWidget {
  List<String> imagePaths;
  int currentIndex;
  PhotoViewPage(
      {super.key, required this.imagePaths, required this.currentIndex});

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  late PageController _controller;
  @override
  Widget build(BuildContext context) {
    _controller = PageController(initialPage: widget.currentIndex);
    return Scaffold(
      body: PageView.builder(
          controller: _controller,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                PhotoView(
                  imageProvider: NetworkImage(widget.imagePaths[index]),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(top: 45, right: 20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white24,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      "${index + 1} / ${widget.imagePaths.length}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}   