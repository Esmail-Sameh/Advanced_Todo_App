import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_advanced/ui/widgets/button.dart';
import 'package:todo_app_advanced/ui/widgets/input_field.dart';

import '../theme.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startDate = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endDate = DateFormat('hh:mm a')
      .format(DateTime.now().add(Duration(minutes: 15)))
      .toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int _selected_color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.dialogBackgroundColor,
      appBar: _AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Text(
                  'Add Task',
                  style: supHeadingTextStyle,
                ),

                /// Title field
                InputField(
                  title: 'Title',
                  hint: 'Enter title here',
                  controller: _titleController,
                ),

                /// Note field
                InputField(
                    title: 'Note',
                    hint: 'Enter note here',
                    controller: _noteController),

                /// Date field
                InputField(
                  title: 'Date',
                  hint: 'Enter note here',
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
                      title: 'Start date',
                      hint: _startDate,
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
                      title: 'End date',
                      hint: _endDate,
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
                  title: 'Remind',
                  hint: '$_selectedRemind minutes early',
                  widget: Row(
                    children: [
                      DropdownButton(
                        items: remindList
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
                          setState(() {
                            _selectedRemind = int.parse(newValue!);
                            print(_selectedRemind);
                          });
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
                  title: 'Repeat',
                  hint: _selectedRepeat,
                  widget: Row(
                    children: [
                      DropdownButton(
                        items: repeatList
                            .map(
                              (String? value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value!,
                                    style: const TextStyle(color: Colors.white),
                                  )),
                            )
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedRepeat = newValue!;
                          });
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
                      _selectedColorPaletes(),
                      MyButton(
                          text: 'Create Task',
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

  Widget _selectedColorPaletes() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: titleTextStyle,
          ),
          _colorItems(),
        ],
      );

  Widget _colorItems()=>Wrap(
    children: List.generate(
      3,
          (index) => GestureDetector(
        onTap: () {
          setState(() {
            _selected_color = index;
          });
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
            child: _selected_color == index
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

   PreferredSizeWidget? _AppBar ()=>AppBar(
     backgroundColor: context.theme.dialogBackgroundColor,
    actions: [
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/person.jpeg'),
        radius: 20,
      ),
    ],
  );
}
