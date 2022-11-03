import 'package:flutter/material.dart';
import 'package:tableview_flut/constant.dart';
import 'package:tableview_flut/second.dart';
void main() {
  runApp(table_view());
}
class table_view extends StatelessWidget {
  const table_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings App',
      theme: kDarkTheme,
      home: ScreenSet(),
    );
  }
}
class ScreenSet extends StatefulWidget {
  const ScreenSet({Key? key}) : super(key: key);

  @override
  State<ScreenSet> createState() => _ScreenSetState();
}

class _ScreenSetState extends State<ScreenSet> {
  @override
  Widget build(BuildContext context) {
    Widget CreateTab(Color colour, IconData icon, String s,double val){
      return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 45,
        decoration: BoxDecoration(color: Colors.grey[800],borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            ClipRect(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                height: 30,
                width: 30,
                color: colour,
                child: Icon(icon),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 25)),
            Text(s,style: KTextStyle(18.0),),
            Padding(padding: EdgeInsets.only(left: val)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      );
    }
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 50)),
          Text('Settings',
          style: KTextStyle(60.0),),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()),);
            },
            child: Container(
              margin: EdgeInsets.all(20),
              height: 90,
              decoration: BoxDecoration(color: Colors.grey[800],borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 15)),
                  CircleAvatar(backgroundImage: AssetImage('assets/cartoon.jpeg'),radius: 35,),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text('Satguru Technologies',style: KTextStyle(22.0),),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          CreateTab(Colors.orangeAccent,Icons.airplanemode_active_outlined,'Airplane Mode',140),
          Divider(height: 2,thickness: 3,endIndent: 40,indent: 40,),
          CreateTab(Colors.blueAccent,Icons.wifi,'Wi-Fi',212),
          Divider(height: 2,thickness: 3,endIndent: 40,indent: 40,),
          CreateTab(Colors.blueAccent,Icons.bluetooth,'Bluetooth',174),
          Divider(height: 2,thickness: 3,endIndent: 40,indent: 40,),
          CreateTab(Colors.green,Icons.cell_tower_outlined,'Mobile Data',155),
          SizedBox(height: 40,),
          CreateTab(Colors.redAccent,Icons.notifications_active,'Notifications',150),
          Divider(height: 2,thickness: 3,endIndent: 40,indent: 40,),
          CreateTab(Colors.red,Icons.volume_up,'Sounds & Haptics',110),
          Divider(height: 2,thickness: 3,endIndent: 40,indent: 40,),
          CreateTab(Color(0xB50202BD),Icons.nightlight_round,'Focus',205),
          Divider(height: 2,thickness: 3,endIndent: 40,indent: 40,),
          CreateTab(Color(0xB50202BD),Icons.hourglass_bottom_rounded,'Screen Time',150),
          SizedBox(height: 40,),
          CreateTab(Colors.grey,Icons.settings,'General',190),

        ],
      ),
    );
  }
}



