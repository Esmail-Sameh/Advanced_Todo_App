import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_advanced/services/theme_services.dart';
import 'package:todo_app_advanced/ui/size_config.dart';
import 'package:todo_app_advanced/ui/widgets/button.dart';

import '../widgets/input_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.dialogBackgroundColor,
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          ThemeServices().switchTheme();
        }, icon: Icon(Icons.brightness_4_outlined),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              InputField(title: 'Title', hint: 'Enter Task Title',),
              SizedBox(height: 30,),
              MyButton(text: 'add text', onTap: (){}),
            ],
          ),
      ),
    );
  }
}
