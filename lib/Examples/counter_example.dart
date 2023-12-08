import 'package:example_with_getx/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterExample extends StatelessWidget {
  CounterExample({Key? key}) : super(key: key);

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementCounter();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Counter Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return Text(
            controller.count.toString(),
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.w600, color: Colors.cyan),
          );
        }),
      ),
    );
  }
}
