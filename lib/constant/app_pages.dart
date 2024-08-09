import 'app_imports.dart';

class AppPages {
  static  List<GetPage> pages = [
    GetPage(
      name: AppStrings.homeRoute,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppStrings.notificationRoute,
      page: () =>  NotificationPage(),
    ),
    GetPage(
      name: AppStrings.addTaskRoute,
      page: () => AddTaskPage(),
    ),
  ];
}
