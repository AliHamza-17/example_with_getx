import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;

  incrementCounter() {
    count.value++;
    print(count);
  }
}