import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data_models/to_do_dm.dart';
import '../utility/constant.dart';

class SettingProvider extends ChangeNotifier {
  List<ToDoDM> todos = [];
  DateTime selectedDay = DateTime.now();

  String currantLanguage = "en";
  ThemeMode currentMode = ThemeMode.light;

  changeCurrentLocal(String newLanguage) {
    if (newLanguage == currantLanguage) {
      return;
    }
    currantLanguage = newLanguage;
    notifyListeners();
  }

  changeCurrentTheme(ThemeMode newMode) {
    if (newMode == currentMode) {
      return;
    }
    currentMode = newMode;
    notifyListeners();
  }

  fetchTodosFromFireStore() async {
    var ToDosCollection =
        FirebaseFirestore.instance.collection(ToDoDM.collectionName);
    var quary = await ToDosCollection.get();
    todos = quary.docs.map((doc) {
      var map = doc.data();
      return ToDoDM(
          id: map[idKey],
          title: map[titleKey],
          time: DateTime.fromMicrosecondsSinceEpoch(map[dateTimeKey]),
          description: map[descriptionKey],
          isDone: map[isDoneKey]);
    }).toList();

    todos = todos.where((todo) {
      return todo.time.year == selectedDay.year &&
          todo.time.month == selectedDay.month &&
          todo.time.day == selectedDay.day;
    }).toList();

    todos.sort((todo1,todo2){
return todo1.time.compareTo(todo2.time);
    });
    notifyListeners();
  }
  changeSelectDate(DateTime newDate){
    selectedDay=newDate;
fetchTodosFromFireStore();  }
}
