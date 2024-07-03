
import 'package:flutter/material.dart';
import 'package:flutter_application_1/studentController.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Studentcontroller _con = Get.put(Studentcontroller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Example'),
        ),
        body: ListView.builder(
          itemCount: _con.studentList.length,
          itemBuilder: (BuildContext context,int index) {
            return Container(
              margin: EdgeInsets.all(15),
              padding:  EdgeInsets.all(15),
              child: Column(
                children: [
                  GetX<Studentcontroller>(
                    builder: (_) => Text(
                      "ID: ${_con.studentList[index]().studentId}, Name: ${_con.studentList[index]().studentName}, Grade: ${_con.studentList[index]().studentGrade}",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () => _con.updateStudentName(
                        _con.newStudentNames[index],index
                      ),
                       child: const Text("이름 변경")
                      ),
                       TextButton(onPressed: () => _con.updateStudentGrade(
                        _con.newStudnetGrades[index],index
                      ),
                       child: const Text("성적 변경")
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}