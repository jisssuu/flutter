import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Title"),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal, // 기본값은 vertical !
        children: [
          postContainer(title:"Title 1",colorData: Colors.blue),
          postContainer(title:"Title 2",colorData: Colors.green),
          postContainer(title:"Title 3",colorData: Colors.pink),
          postContainer(title:"Title 4",colorData: Colors.purple),
          postContainer(title:"Title 5",colorData: Colors.blueGrey)
        ]
      ),
    );
  }

  Widget postContainer({String title = '', Color colorData = Colors.blue}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: colorData
          ),
      ],
    );
  }
}
