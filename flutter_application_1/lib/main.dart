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

  final postList = [
    {
      "number" : "0",
      "color" : Colors.amber,
    },
    {
      "number" : "1",
      "color" : Colors.black,
    },
    {
      "number" : "2",
      "color" : Colors.blue,
    },
    {
      "number" : "3",
      "color" : Colors.purple,
    },
    {
      "number" : "4",
      "color" : Colors.pink,
    },
    {
      "number" : "5",
      "color" : Colors.grey,
    },
    {
      "number" : "6",
      "color" : Colors.brown,
    },
    {
      "number" : "7",
      "color" : Colors.lightGreen,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Title"),
      ),
       body: Container(
        child: Stack(
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color:Colors.black26,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                color: Colors.brown,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 40,bottom: 150),
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 200),
                width: 300,
                height: 70,
                color: Colors.blue,
              ),
            )
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.amber,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.blue,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.green,
            //   ),
            // ),Align(
            //   alignment: Alignment.centerLeft,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.amber,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.blue,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.green,
            //   ),
            // ),Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.amber,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.blue,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.green,
            //   ),
            // )
          ],
        ),
       ),
    );
  }

}
