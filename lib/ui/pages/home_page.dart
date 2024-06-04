import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_advanced/constant/app_imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: _AppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _addTaskBar(),
            _addDateBar(),
          ],
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
            onTap: () {},
          ),
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
