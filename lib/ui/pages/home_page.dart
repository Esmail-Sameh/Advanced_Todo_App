import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_advanced/services/theme_services.dart';
import 'package:todo_app_advanced/ui/pages/add_task_page.dart';
import 'package:todo_app_advanced/ui/size_config.dart';
import 'package:todo_app_advanced/ui/widgets/button.dart';

import '../widgets/input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: _AppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            InputField(
              title: 'Title',
              hint: 'Enter Task Title',
            ),
            SizedBox(
              height: 30,
            ),
            MyButton(
                text: 'add text',
                onTap: () {
                  Get.to(AddTaskPage());
                }),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget? _AppBar(context) => AppBar(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.jpeg'),
            radius: 20,
          ),
        ],
        leading: IconButton(
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon: Icon(Get.isDarkMode
              ? Icons.wb_sunny_outlined
              : Icons.nightlight_round_outlined),
        ),
      );
}
