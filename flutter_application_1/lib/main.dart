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
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.blue[100] as Color,
        //     Colors.blue[300] as Color,
        //     Colors.blue[500] as Color,
        //     Colors.blue[700] as Color,
        //   ],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   stops: const [0.1, 0.4, 0.7, 1.0],
        // )
        gradient: RadialGradient(
          center: Alignment.center,
          colors: [
            Colors.amber[100] as Color,
            Colors.amber[300] as Color,
            Colors.amber[500] as Color,
            Colors.amber[700] as Color,
          ],
          stops: [0.1, 0.3, 0.7, 1.0],
          radius: 1.0
        )
      ),
     ),
      );
  }
}
