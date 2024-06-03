import 'app_imports.dart';

class AppPages {
  static  List<GetPage> pages = [
    GetPage(
      name: AppStrings.homeRoute,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppStrings.notificationRoute,
      page: () => const NotificationPage(),
    ),
    GetPage(
      name: AppStrings.addTaskRoute,
      page: () =>  AddTaskPage(),
    ),
  ];
}
