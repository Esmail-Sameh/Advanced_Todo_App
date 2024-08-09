// ignore_for_file: prefer_const_constructors

import 'package:todo_app_advanced/constant/app_imports.dart';

class AddTaskPage extends StatelessWidget {
   final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.dialogBackgroundColor,
      appBar: _AppBar(controller, context),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Text(
                  AppStrings.addTaskPageTitle,
                  style: supHeadingTextStyle,
                ),

                /// Title field
                InputField(
                  title: AppStrings.titleText,
                  hint: AppStrings.enterTitleHereText,
                  controller: controller.titleController,
                ),

                /// Note field
                InputField(
                    title: AppStrings.noteText,
                    hint: AppStrings.enterNoteHereText,
                    controller: controller.noteController),

                /// Date field
                InputField(
                  title: AppStrings.dataText,
                  hint: AppStrings.enterNoteHereText,
                  widget: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),

                /// Start time & End time
                Row(
                  children: [
                    /// Start date
                    Expanded(
                        child: InputField(
                      title: AppStrings.startDateText,
                      hint: controller.startDate,
                      widget: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            // size: 30,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 12,
                    ),

                    /// End date
                    Expanded(
                        child: InputField(
                      title: AppStrings.endDateText,
                      hint: controller.endDate,
                      widget: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    )),
                  ],
                ),

                /// Remind date
                InputField(
                  title: AppStrings.remindText,
                  hint:
                      '${controller.selectedRemind} ${AppStrings.minutesEarlyText}',
                  widget: Row(
                    children: [
                      DropdownButton(
                        items: controller.remindList
                            .map(
                              (int value) => DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(
                                  '$value',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList(),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        iconSize: 30,
                        elevation: 4,
                        underline: Container(
                          height: 0,
                        ),
                        dropdownColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        onChanged: (newValue) {
                          controller.selectedRemindFunction(newValue);
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),

                /// Repeat date
                InputField(
                  title: AppStrings.repeatText,
                  hint: controller.selectedRepeat,
                  widget: Row(
                    children: [
                      DropdownButton(
                        items: controller.repeatList
                            .map(
                              (String? value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value!,
                                    style: const TextStyle(color: Colors.white),
                                  )),
                            )
                            .toList(),
                        onChanged: (String? newValue) {
                          controller.selectedRepeatFunction(newValue);
                        },
                        underline: Container(
                          height: 0,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        iconSize: 30,
                        dropdownColor: Colors.blueGrey,
                        elevation: 4,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                ),

                /// Row color palet and add task btn
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _selectedColorPaletes(controller),
                      MyButton(
                          text: AppStrings.createTaskText,
                          onTap: () {
                            Get.back();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedColorPaletes(TaskController controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.colorText,
            style: titleTextStyle,
          ),
          _colorItems(controller),
        ],
      );

  Widget _colorItems(TaskController controller) => Wrap(
        children: List.generate(
          3,
          (index) => GestureDetector(
            onTap: () {
              // setState(() {
              //   _selected_color = index;
              // });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: index == 0
                    ? bluishClr
                    : index == 1
                        ? orangeClr
                        : pinkClr,
                radius: 11,
                child: controller.selected_color == index
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 12,
                      )
                    : null,
              ),
            ),
          ),
        ),
      );

  PreferredSizeWidget? _AppBar(TaskController controller, context) => AppBar(
        backgroundColor: context.theme.dialogBackgroundColor,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(AppStrings.personImages),
            radius: 20,
          ),
        ],
      );
}
