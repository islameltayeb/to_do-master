import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/setting_provider.dart';
import 'package:to_do/ui/bottom_sheet/add_bottom.dart';
import 'package:to_do/ui/screens/home/tabs/list_tabs/list_tab.dart';
import 'package:to_do/ui/screens/home/tabs/setting_tab/setting_tab.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  static String routeName = "Home ";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [ListTab(), SettingTab()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of(context) ;

    return Scaffold(
      appBar: AppBar(
        title:Text(AppLocalizations.of(context)!.todolist),
        toolbarHeight: MediaQuery.of(context).size.height * .20,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/icon_list.png")), label: "Menue"),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_settings.png")), label: "Settings")
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomAppBar(
        color: Colors.transparent,
        shape: CircularNotchedRectangle(),
        elevation: 0,
        notchMargin: 20,
        clipBehavior: Clip.hardEdge,
        child: FloatingActionButton(
          onPressed: () {
            showAddButomSheet();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
          shape: const StadiumBorder(
              side: BorderSide(
            color: Colors.white,
            width: 3,
          )),
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  void showAddButomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddBottom();
        });
  }
}
