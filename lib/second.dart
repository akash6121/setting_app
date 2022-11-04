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
    Widget makeTile(String text,[IconData? icon]){
      return ListTile(
        leading: Icon(icon),
        title: Text(text),
        contentPadding: EdgeInsets.all(15),
        tileColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        visualDensity: VisualDensity(vertical: -4),
        trailing: Icon(Icons.arrow_forward_ios),);
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF212121),title: Text('Apple ID'),centerTitle: true,),
      body: ListView(
        padding: EdgeInsets.all(35),
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
          Text('Satguru Technologies',style: KTextStyle(30.0),textAlign: TextAlign.center,),
          Text('satgurutechnologies12@gmail.com',textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          makeTile('Name,Phone Numbers,Email'),
          makeTile('Password & Security'),
          makeTile('Payment & Shipping'),
          makeTile('Subscription'),
          makeTile('bjcsb',Icons.cabin),
    ]
      ),
    );
  }
}
