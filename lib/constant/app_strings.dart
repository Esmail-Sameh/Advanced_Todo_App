import 'package:intl/intl.dart';

class AppStrings {
  /// App Name
  static const String appName = "TO DO";

  /// App Titles.
  static const String addTaskPageTitle = 'Add Task';
  static const String homePageTitle = 'Today';
  static String homePageDateTitle = DateFormat.yMMMMd().format(DateTime.now());

  /// App Route.
  static const String homeRoute = '/homePage';
  static const String addTaskRoute = '/addTaskPage';
  static const String notificationRoute = '/notificationPage';

  /// App Signs.
  static const String plusSign = "+";
  static const String spaceSign = " ";
  static const String colonSign = ":";
  static const String minusSign = "-";

  // static const String dollarSign = "\$";

  /// App Images.
  static const String appIconImages = 'assets/images/appicon.jpeg';
  static const String personImages = 'assets/images/person.jpeg';
  static const String taskImages = 'assets/images/task.svg';

  /// Add Task Page.
  static const String titleText = 'Title';
  static const String enterTitleHereText = 'Enter title here';
  static const String noteText = 'Note';
  static const String enterNoteHereText = 'Enter note here';
  static const String dataText = 'Date';
  static const String enterDateHereText = 'Enter date here';
  static const String startDateText = 'Start date';
  static const String endDateText = 'End date';
  static const String remindText = 'Remind';
  static const String repeatText = 'Repeat';
  static const String noneText = 'None';
  static const String minutesEarlyText = 'minutes early';
  static const String colorText = 'Color';
  static const String createTaskText = 'Create Task';

  /// Home Page Text
  static const String addTaskText = '+ Add Task';
  static const String todoText = 'TODO';
  static const String completedText = 'Completed';


}
