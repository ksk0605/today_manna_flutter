import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_manna_flutter/models/today_range.dart';
import 'package:today_manna_flutter/providers/checklist_provider.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({Key? key}) : super(key: key);

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChecklistProvider>(
        builder: (context, checklistProvider, child) {
      checklistProvider.getChecklist();
      final checklist = checklistProvider.checklist;
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check_box,
                  color: Colors.black,
                  size: 35,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.alt,
                  color: Colors.black,
                  size: 30,
                )),
          ],
          title: Text(
            '체크리스트',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: checklist.length,
          itemBuilder: (context, index) {
            print(checklist.length);
            return Text(checklist[index].date);
          },
        ),
      );
    });
  }
}
