import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0),
          ListTile(
            title: SystemThemeText(),
            trailing: ThemeSwitch(),
          ),
        ],
      ),
    );
  }
}

class SystemThemeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final systemBrightness = MediaQuery.platformBrightnessOf(context);
    final activeTheme = systemBrightness == Brightness.light ? 'Light' : 'Dark';
    final titleText = 'Change to $activeTheme';

    return Text(
      titleText,
      style: TextStyle(fontSize: 18.0),
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  RxBool isSwitched = true.obs; // Use RxBool for reactive state

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Switch(
        onChanged: (value) {
          isSwitched.value = value;
          // Change the theme based on the switch value
          Get.changeThemeMode(
              isSwitched.value ? ThemeMode.light : ThemeMode.dark);
        },
        value: isSwitched.value,
        activeColor: Colors.blue,
        activeTrackColor: Colors.yellow,
        inactiveThumbColor: Colors.redAccent,
        inactiveTrackColor: Colors.orange,
      );
    });
  }
}
