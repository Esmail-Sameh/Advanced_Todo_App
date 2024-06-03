


import 'package:todo_app_advanced/constant/app_pages.dart';

import 'constant/app_imports.dart';

void main(context) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: 'To Do',
      debugShowCheckedModeBanner: false,

      initialRoute: AppStrings.homeRoute,
      getPages: AppPages.pages,
    );
  }
}
