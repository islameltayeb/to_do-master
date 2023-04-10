import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/setting_provider.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of(context);
    return Column(
      children: [
        InkWell(
          onTap: (){
        provider.changeCurrentLocal("en");

          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text("English",style: Theme.of(context).textTheme.headline1,),
          ),
        ),
        InkWell(
          onTap: (){
            provider.changeCurrentLocal("ar");
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text("العربية ",style: Theme.of(context).textTheme.headline1,),
          ),
        ),
      ],
    );
  }
}
