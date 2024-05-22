import 'package:flutter/material.dart';
import 'package:todo_app_advanced/services/theme_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ThemeServices().switchTheme();
        }, icon: Icon(Icons.brightness_4_outlined),
      ),
      ),
    );
  }
}
