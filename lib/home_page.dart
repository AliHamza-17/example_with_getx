import 'package:example_with_getx/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Example'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(Setting());
              },
              icon: Icon(Icons.settings)),
          LanguageDropdown()
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.snackbar('Error Message', 'This is a Snackbar example');
              },
              child: const Text('Show Snackbar'),
            ),
            TextButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    width: double.infinity,
                    color: Get.isDarkMode
                        ? Colors.blueGrey // Dark theme color
                        : Colors.amber, // Light theme color
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.changeThemeMode(ThemeMode.light);
                          },
                          child: const Text('Light Theme'),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.changeThemeMode(ThemeMode.dark);
                          },
                          child: const Text('Dark Theme'),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.changeThemeMode(ThemeMode.system);
                          },
                          child: const Text('System Mode'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('Change Theme'),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: DropdownButton(
        value: Get.locale,
        items: [
          DropdownMenuItem(
            value: Locale('en', 'US'),
            child: Text('English'),
          ),
          DropdownMenuItem(
            value: Locale('es', 'ES'),
            child: Text('Español'),
          ),
          // Add more language options as needed
        ],
        onChanged: (locale) {
          Get.updateLocale(locale!);
        },
      ),
    );
  }
}
