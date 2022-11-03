import 'package:flutter/material.dart';
import 'package:tableview_flut/constant.dart';
import 'main.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF212121),title: Text('Apple ID'),centerTitle: true,),
      body: Column(
        children: <Widget>[
          Align(
          alignment: FractionalOffset(0.5,0.5),
          child: CircleAvatar(backgroundImage: AssetImage('assets/cartoon.jpeg'),radius: 50,
          child: Align(
            alignment: FractionalOffset(0.9,0.9),
            child: Container(
              height: 15,
              width: 90,
              color: Colors.black26,
              child: Text('EDIT',textAlign: TextAlign.center,),
            ),
          ),),
        ),
          SizedBox(height: 10,),
          Text('Satguru Technologies',style: KTextStyle(30.0),),
          Text('satgurutechnologies12@gmail.com'),

    ]
      ),
    );
  }
}
