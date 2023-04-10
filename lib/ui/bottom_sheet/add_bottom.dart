import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/setting_provider.dart';
import 'package:to_do/utility/mythemedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data_models/to_do_dm.dart';
import '../../utility/constant.dart';

class AddBottom extends StatefulWidget {
  @override
  State<AddBottom> createState() => _AddBottomState();
}

class _AddBottomState extends State<AddBottom> {
  GlobalKey<FormState> myKey = new GlobalKey<FormState>();
  DateTime selectDateTime = DateTime.now();
  String title = '';
  String description = '';
  late SettingProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Form(
      key: myKey,
      child: Container(
        color: provider.currentMode == ThemeMode.light
            ? MythemeData.bgItemColor
            : MythemeData.bgItemColorDark,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.addnewtask,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.title,
                labelStyle: Theme.of(context).textTheme.headline1,
              ),
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please enter title";
                }
              },
              onChanged: (value) {
                title = value;
              },
            ),
            TextFormField(
              maxLines: 4,
              minLines: 3,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.description,
                  labelStyle: Theme.of(context).textTheme.headline1),
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please enter description";
                }
              },
              onChanged: (value) {
                description = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.selecttime,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  showMyDatePker();

                },
                child: Text(
                  '${selectDateTime.day}/ ${selectDateTime.month}/${selectDateTime.year}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
            ),
            Spacer(),
            Container(
                padding: EdgeInsets.all(18),
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      myKey.currentState!.validate();
                      addOnClick();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.add,
                      style: TextStyle(fontSize: 20),
                    )))
          ],
        ),
      ),
    );
  }

  void showMyDatePker() async {
    selectDateTime = await showDatePicker(
          context: context,
          initialDate: selectDateTime,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            Duration(days: 365),
          ),
        ) ??
        DateTime.now();
    setState(() {

    });
  }

  void addOnClick() {
    if (!myKey.currentState!.validate()) return;
    var todosCollection =
        FirebaseFirestore.instance.collection(ToDoDM.collectionName);
    var emptyDoc = todosCollection.doc();
    emptyDoc.set({
      idKey: emptyDoc.id,
      titleKey: title,
      descriptionKey: description,
      dateTimeKey: selectDateTime.microsecondsSinceEpoch,
      isDoneKey: false,
    }).timeout(Duration(milliseconds: 500), onTimeout: () {
      provider.fetchTodosFromFireStore();
      Navigator.pop(context);
    });
  }
}
