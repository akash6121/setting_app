import 'package:flutter/material.dart';
import 'package:tableview_flut/constant.dart';
import 'package:tableview_flut/second.dart';
void main() {
  runApp(const table_view());
}
class table_view extends StatelessWidget {
  const table_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings App',
      theme: kDarkTheme,
      home: const ScreenSet(),
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
    Widget addLine(){
      return const Divider(height: 0, thickness: 1, endIndent: 20, indent: 80,);
    }
    Widget createTab(Color colour, IconData icon, String s){
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListTile(
          tileColor: Colors.grey[850],
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 37,
                  width: 37,
                  color: colour,
                  child: Icon(icon),
                ),
              ),
              title: Text(s,style: KTextStyle(18.0),),
              trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 17,),
          ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: ListView(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 50)),
                Text('Settings', style: KTextStyle(60.0),),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Settings()),);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
                    height: 90,
                    decoration: BoxDecoration(color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 15,),
                        const CircleAvatar(backgroundImage: AssetImage(
                            'assets/cartoon.jpeg'), radius: 35,),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Text('Satguru Technologies',
                            style:  KTextStyle(22.0),overflow: TextOverflow.ellipsis,maxLines: 2,),
                        ),
                        const Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 17,),
                        const Padding(padding: EdgeInsets.only(left: 25))
                      ],
                    ),
                  ),
                ),
      Card(
        color: kTileColor,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
                createTab(
                    Colors.orangeAccent, Icons.airplanemode_active_outlined,
                    'Airplane Mode',),
                addLine(),
                createTab(Colors.blueAccent, Icons.wifi, 'Wi-Fi'),
                addLine(),
                createTab(Colors.blueAccent, Icons.bluetooth, 'Bluetooth',),
                addLine(),
                createTab(
                    Colors.green, Icons.cell_tower_outlined, 'Mobile Data',),
          ],
        ),
      ),
                const SizedBox(height: 40,),
      Card(
        color: kTileColor,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
                createTab(Colors.redAccent, Icons.notifications_active,
                    'Notifications',),
                addLine(),
                createTab(Colors.red, Icons.volume_up, 'Sounds & Haptics',),
                addLine(),
                createTab(
                    const Color(0xB50202BD), Icons.nightlight_round, 'Focus',),
                addLine(),
                createTab(const Color(0xB50202BD), Icons.hourglass_bottom_rounded,
                    'Screen Time',),
          ],
        ),
      ),
                const SizedBox(height: 40,),
                Card(
                    color: kTileColor,
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: createTab(Colors.grey, Icons.settings, 'General')),

              ],
            ),
        ),
      );
  }
}



