import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: Container(
      child: Row(
        children: [
          // Flexible(
          //   flex: 2,
          //   child: Container(
          //     height: 150,
          //     color: Colors.blue,
          //   ),
          // ),
          // Flexible(
          //   flex: 3,
          //   child: Container(
          //     height: 150,
          //     color: Colors.green,
          //   ),
          // )
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          ),Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
            ),
          )
        ],
      ),
      ),

      );
  }
}
