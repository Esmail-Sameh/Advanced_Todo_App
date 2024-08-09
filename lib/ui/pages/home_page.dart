// ignore_for_file: use_key_in_widget_constructors

import 'package:todo_app_advanced/constant/app_imports.dart';
import 'package:todo_app_advanced/ui/widgets/task_tile.dart';

import '../../models/task.dart';

class HomePage extends StatelessWidget {
  Task data = Task(
    id: 1,
    title: 'Go to gym',
    color: 2,
    note: 'Body Body Body Body Body Body Body Body Body Body Body Body Body Body Body Body Body',
    startTime: '2:40 . ',
    endTime: '5:20',
    isCompleted: 1,
    date: "",
    repeat: '',
    remind: 1,

  );
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: _AppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _addTaskBar(),
              const SizedBox(
                height: 10,
              ),

              _addDateBar(),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
              TaskTile(task: data,),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? _AppBar(context) => AppBar(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(AppStrings.personImages),
            radius: 20,
          ),
        ],
        leading: IconButton(
          onPressed: () {
            ThemeServices().switchTheme();

            NotifyHelper.showBasicNotification(title: "Notification Test", body: "show Basic Notification", id: 1);

            NotifyHelper.showScheduledNotification(title: "Notification Test", body:"show Scheduled Notification" , id: 2);
          },
          icon: Icon(Get.isDarkMode
              ? Icons.wb_sunny_outlined
              : Icons.nightlight_round_outlined),
        ),
      );

  Widget _addTaskBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.homePageDateTitle,
                style: supHeadingTextStyle,
              ),
              Text(
                AppStrings.homePageTitle,
                style: headingTextStyle,
              ),
            ],
          ),
          MyButton(
              text: AppStrings.addTaskText,
              onTap: () {
                 Get.toNamed(AppStrings.addTaskRoute);
              }),
        ],
      ),
    );
  }

  Widget _addDateBar() {
    return Container(
      child: DatePicker(
        DateTime.now(),
        width: 70,
        height: 90,
        selectedTextColor: Colors.white,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        dateTextStyle: GoogleFonts.lato(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        dayTextStyle: GoogleFonts.lato(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        monthTextStyle: GoogleFonts.lato(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
