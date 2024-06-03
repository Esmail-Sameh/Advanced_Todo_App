import 'package:intl/intl.dart';
import '../constant/app_imports.dart';

class TaskController extends GetxController {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String startDate = DateFormat('hh:mm a').format(DateTime.now());
  String endDate = DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 15)));
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int selected_color = 0;

  void selectedRepeatFunction (String? newValue){
    selectedRepeat = newValue!;
    update();
  }

  void selectedRemindFunction (String? newValue){
    selectedRemind = int.parse(newValue!);
    update();
  }

}
