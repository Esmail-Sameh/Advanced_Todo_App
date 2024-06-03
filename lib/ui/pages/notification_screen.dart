import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.dialogBackgroundColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Title'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello, Esmail',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: 5,),
            Text(
              'You have a new reminder',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                margin: EdgeInsets.only(bottom: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryClr,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildItems(
                          title: 'Title', iconItem: Icons.text_format_outlined),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Title',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildItems(
                          title: 'Description', iconItem: Icons.description),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'description',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildItems(
                          title: 'Date', iconItem: Icons.date_range_outlined),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItems({required String title, required IconData iconItem}) => Row(
        children: [
          Icon(
            iconItem,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 30, color: Colors.white),
          )
        ],
      );
}
