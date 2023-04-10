import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/data_models/to_do_dm.dart';
import 'package:to_do/provider/setting_provider.dart';
import 'package:to_do/utility/mythemedata.dart';

class ToDoItem extends StatelessWidget {
ToDoDM toDo;
ToDoItem(this.toDo);
  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of(context);

    return Container(

      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

      decoration: BoxDecoration(
        color:provider.currentMode==ThemeMode.light? Colors.white:MythemeData.bgItemColorDark,

        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(

        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15,18,12,18),
            color: MythemeData.itemColor,
            width: 3,
            height: 50,
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(toDo.title,style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.start,),
                SizedBox(height: 12,),
                Text(toDo.description ,style: Theme.of(context).textTheme.bodyText2,),
                //Text("${toDo.time}")
              ],
            ),
          ),
          Spacer(flex: 2,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MythemeData.itemColor,

            ),
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: ImageIcon(AssetImage("assets/images/icon_check.png"),color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
