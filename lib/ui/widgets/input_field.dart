import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_advanced/ui/size_config.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  String title;
  String hint;
  TextEditingController? controller;
  Widget? widget;
  void Function()? onTap;

  InputField({
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: titleTextStyle,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            width: SizeConfig.screenWidth,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '$hint',
                      hintStyle: supTitleTextStyle.copyWith(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    cursorColor: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                    readOnly: widget != null ? true : false,
                    controller: controller,
                    autofocus: false,
                    onTap: onTap ,
                  ),
                ),
                widget ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
