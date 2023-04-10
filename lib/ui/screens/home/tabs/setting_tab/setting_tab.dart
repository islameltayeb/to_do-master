import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/setting_provider.dart';
import 'package:to_do/ui/screens/home/tabs/setting_tab/language_bottom_sheet.dart';
import 'package:to_do/ui/screens/home/tabs/setting_tab/mode_bottom_sheet.dart';
import 'package:to_do/utility/mythemedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          InkWell(
            onTap: () {
              showLangugeModelButtonSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MythemeData.itemColor)),
              child: Row(
                children: [
                  Text(
                    provider.currantLanguage == "en" ? "English" : "العربية",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down, color: MythemeData.itemColor),
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          InkWell(
            onTap: () {
              showModeModelButtonSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MythemeData.itemColor)),
              child: Row(
                children: [
                  Text(
                    provider.currentMode==ThemeMode.light?"light":"Dark",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down, color: MythemeData.itemColor),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLangugeModelButtonSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showModeModelButtonSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ModeBottomSheet();
        });
  }
}
