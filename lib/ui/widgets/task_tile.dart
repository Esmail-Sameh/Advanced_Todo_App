import 'package:todo_app_advanced/constant/app_imports.dart';

import '../../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _getBGColor(task.color!),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text('${task.title}',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 5,
                ),

                /// Date(Start & End)
                Row(
                  children: [
                    /// Start Date
                    Icon(
                      Icons.access_time,
                      size: 15,
                      color: Colors.grey[200],
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '${task.startTime}',
                      style: GoogleFonts.lato(
                        color: Colors.grey[200],
                        fontSize: 14,
                      ),
                    ),

                    ///End Date
                    Icon(
                      Icons.access_time,
                      size: 15,
                      color: Colors.grey[200],
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '${task.endTime}',
                      style: GoogleFonts.lato(
                        color: Colors.grey[200],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),

                /// Body
                Text(
                  '${task.note}',
                  style: GoogleFonts.lato(
                    color: Colors.grey[200],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 1),
            width: 2,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task.isCompleted == 0
                  ? AppStrings.todoText
                  : AppStrings.completedText,
              style: TextStyle(
                color: Colors.grey[100],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getBGColor(int color) {
    switch (color) {
      case 0:
        return bluishClr;
      case 1:
        return orangeClr;
      case 2:
        return pinkClr;
      default:
        return primaryClr;
    }
  }
}
