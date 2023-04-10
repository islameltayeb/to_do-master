import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:to_do/data_models/to_do_dm.dart';
import 'package:to_do/provider/setting_provider.dart';
import 'package:to_do/ui/screens/home/tabs/list_tabs/to_do_item.dart';
import 'package:to_do/utility/mythemedata.dart';

import '../../../../../utility/constant.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {


  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    if (provider.todos.isEmpty) provider.fetchTodosFromFireStore();
    return Container(
        color: provider.currentMode == ThemeMode.light
            ? MythemeData.accentColor
            : MythemeData.accentColorDark,
        child: Column(
          children: [
            CalendarTimeline(
              initialDate:provider.selectedDay,
              firstDate: provider.selectedDay.subtract(Duration(days: 365)),
              lastDate: provider.selectedDay.add(Duration(days: 365)),
              onDateSelected: (date) {

                provider.changeSelectDate(date);
                setState(() {});
                provider.fetchTodosFromFireStore();
              },
              leftMargin: 20,
              monthColor: provider.currentMode == ThemeMode.light
                  ? Color(0xff363636)
                  : Colors.white,
              dayColor: provider.currentMode == ThemeMode.light
                  ? MythemeData.titleTaskColor
                  : Colors.white,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: MythemeData.itemColor,
              dotsColor: Colors.transparent,
              //selectableDayPredicate: (date) => date.day != 23,
              locale: provider.currantLanguage,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: provider.todos.length,
                    itemBuilder: (_, index) {
                      return ToDoItem(
                        provider.todos[index],
                      );
                    }))
          ],
        ));
  }

}
