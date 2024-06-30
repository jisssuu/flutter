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
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 12.0,
        ),
        children: [
          postContainer(number: "1",colorData: Colors.amber),
          postContainer(number: "2",colorData: Colors.green),
          postContainer(number: "3",colorData: Colors.blue),
          postContainer(number: "4",colorData: Colors.grey), 
        ],
      ),
    );
  }

  Widget postContainer({String number = "0", Color colorData = Colors.amber}) {
    return Container(
          height: 200,
          color: colorData,
          child: Center(child: Text("Box $number")),
        );
  }

}
