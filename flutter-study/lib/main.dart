import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _url = 'https://jsonplaceholder.typicode.com/albums';
  int _page = 1;
  final int _limit = 10;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List _albumList = [];

  late ScrollController _controller;

  final dio = Dio();
  late Throttle _throttledNextLoad;
  late Throttle _throttledButtonClick;
  int _count = 0;

  @override
  void initState() {
    super.initState();

    _initLoad();

    _controller = ScrollController();

    _throttledNextLoad = Throttle(
      const Duration(milliseconds: 1000),
      initialValue: null,
      checkEquality: false,
    )..values.listen((_) => _nextLoad());

    _controller.addListener(() {
      if (_controller.position.extentAfter < 200) {
        _throttledNextLoad.setValue(null);
      }
    });

    _throttledButtonClick = Throttle(
      const Duration(milliseconds: 1000),
      initialValue: 0,
      checkEquality: false,
    )..values.listen((_) => _increaseCount());
  }

  void _initLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    try {
      final res = await dio.get("$_url?_page=$_page&_limit=$_limit");
      debugPrint("$_url?_page=$_page&_limit=$_limit");

      setState(() {
        _albumList = res.data;
      });
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _nextLoad() async {
    if (_hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 200) {
      setState(() {
        _isLoadMoreRunning = true;
      });

      _page += 1;

      try {
        final res = await dio.get("$_url?_page=$_page&_limit=$_limit");
        debugPrint("$_url?_page=$_page&_limit=$_limit");

        final List fetchedPosts = res.data;

        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _albumList.addAll(fetchedPosts);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (e) {
        print(e.toString());
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(() {
      if (_controller.position.extentAfter < 200) {
        _throttledNextLoad.setValue(null);
      }
    });

    _controller.dispose();

    super.dispose();
  }

  void _increaseCount() {
    setState(() {
      _count++;
    });
    debugPrint("_increaseCount() 호출: 현재 count: $_count");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Pagination'),
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: _albumList.length,
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListTile(
                        title: Text(_albumList[index]['id'].toString()),
                        subtitle: Text(_albumList[index]['title']),
                      ),
                    ),
                  ),
                ),
                if (_isLoadMoreRunning == true)
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.blue,
                    child: const Center(
                      child: Text('No more data to be fetched.',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _throttledButtonClick.setValue(_count);
        },
        child: Text(_count.toString()),
      ),
    );
  }
}