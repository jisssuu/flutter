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
      "number": "0",
      "color": Colors.amber,
    },
    {
      "number": "1",
      "color": Colors.black,
    },
    {
      "number": "2",
      "color": Colors.blue,
    },
    {
      "number": "3",
      "color": Colors.purple,
    },
    {
      "number": "4",
      "color": Colors.pink,
    },
    {
      "number": "5",
      "color": Colors.grey,
    },
    {
      "number": "6",
      "color": Colors.brown,
    },
    {
      "number": "7",
      "color": Colors.lightGreen,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Title"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext con) {
                    return AlertDialog(
                      title: const Text("Dialog Title"),
                      content: Container(
                        child: const Text("Dialog Content"),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Close"),
                        )
                      ],
                    );
                  });
            },
            child: Text("Button"),
          ),
        ),
      ),
    );
  }
}
