import 'package:get/get_state_manager/get_state_manager.dart';

class Countercontroller extends GetxController{
int _counter = 0;

int get counter => _counter;

void increase() {
  _counter++;
  update();
}

void decrease() {
  _counter--;
  update();
}

}