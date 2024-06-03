// ignore_for_file: prefer_const_constructors




import 'package:intl/intl.dart';
import 'package:todo_app_advanced/constant/app_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  Widget _addTaskBar(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.homePageDateTitle, style: supHeadingTextStyle,),
              Text(AppStrings.homePageTitle , style: headingTextStyle,),
            ],
          ),
          MyButton(text: AppStrings.addTaskText, onTap: () {

          },),
        ],
      ),
    );
  }
}
