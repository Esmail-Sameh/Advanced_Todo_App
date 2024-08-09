import 'package:todo_app_advanced/ui/size_config.dart';

import 'constant/app_imports.dart';

void main(context)async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotifyHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppStrings.homeRoute,
      getPages: AppPages.pages,
    );
  }
}
