import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/setting_provider.dart';

class ModeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);

    return Column(
      children: [
        InkWell(
          onTap: (){
provider.changeCurrentTheme(ThemeMode.light);
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text("Light",style: Theme.of(context).textTheme.headline1,),
          ),
        ),
        InkWell(
          onTap: (){
            provider.changeCurrentTheme(ThemeMode.dark);
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text("Dark ",style: Theme.of(context).textTheme.headline1,),
          ),
        ),
      ],
    );
  }
}
