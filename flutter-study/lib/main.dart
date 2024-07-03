
import 'package:flutter/material.dart';
import 'package:flutter_application_1/counterController.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              GetBuilder<Countercontroller>(
                init: Countercontroller(),
                builder: (_) => Text("Current Count: ${Get.find<Countercontroller>().counter}"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () => Get.find<Countercontroller>().increase(),
                  child: const Text("증가"),
                  ),
                    TextButton(onPressed: () => Get.find<Countercontroller>().decrease(),
                  child: const Text("감소"),
                  ),
                ],
               ),
            ],
          ),
        ),
      ),
    );
  }
}