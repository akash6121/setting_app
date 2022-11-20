import 'dart:math';
import 'package:tableview_flut/createtab.dart';
import 'package:flutter/cupertino.dart';
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
  bool sign=true;
  @override
  Widget build(BuildContext context) {
    Widget addLine(){
      return const Divider(height: 0, thickness: 1, endIndent: 20, indent: 80,);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
              children: <Widget>[
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                  child: Text('Settings', style: KTextStyle(40.0),),
                ),
                InkWell(
                  onTap: () {
                 Navigator.push(context,
                   MaterialPageRoute(builder: (context) => const Settings()),);
              },
                  child: Card(
                    color: kTileColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      minVerticalPadding: 0,
                      leading: CircleAvatar(backgroundImage: AssetImage('assets/cartoon.jpeg'), radius: 35,),
                      title: Text('Satguru Technologies',
                        style:  KTextStyle(22.0),overflow: TextOverflow.ellipsis,maxLines: 2,),
                      subtitle: Text('Apple ID,iCloud,Media & Purchases',
                                     style:  KTextStyle(17.0),overflow: TextOverflow.ellipsis,maxLines: 2,),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 17,),
                    ),
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
                //   height: 90,
                //   decoration: BoxDecoration(color: Colors.grey[850],
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Row(
                //     children: <Widget>[
                //       SizedBox(width: 15,),
                //       const CircleAvatar(backgroundImage: AssetImage(
                //           'assets/cartoon.jpeg'), radius: 35,),
                //       SizedBox(width: 15,),
                //       InkWell(
                //         onTap: () {
                //           Navigator.push(context,
                //             MaterialPageRoute(builder: (context) => const Settings()),);
                //         },
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text('Satguru Technologies',
                //               style:  KTextStyle(22.0),overflow: TextOverflow.ellipsis,maxLines: 2,),
                //             Container(
                //               width: 200,
                //               child: Text('Apple ID,iCloud,Media & Purchases',
                //                 style:  KTextStyle(17.0),overflow: TextOverflow.ellipsis,maxLines: 2,),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Spacer(),
                //       const Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 17,),
                //       const Padding(padding: EdgeInsets.only(left: 15))
                //     ],
                //   ),
                // ),
      Card(
        color: kTileColor,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 37,
                  width: 37,
                  color: Colors.orangeAccent,
                  child: Icon(CupertinoIcons.airplane),
                ),
              ),
              title: Text('Airplane Mode',style: KTextStyle(18.0),),
              trailing: CupertinoSwitch(activeColor: Colors.green,onChanged: (val){
                setState(() {
                  sign=!sign;
                });
              },value: sign,),
            ),
                // createTab(
                //     Colors.orangeAccent, Icons.airplanemode_active_outlined,
                //     'Airplane Mode',),
                addLine(),
                createTab(Colors.blueAccent, Icons.wifi, 'Wi-Fi','Phoenix'),
                addLine(),
                createTab(Colors.blueAccent, Icons.bluetooth, 'Bluetooth','Off'),
                addLine(),
                createTab(
                    Colors.green, CupertinoIcons.antenna_radiowaves_left_right, 'Mobile Data',(sign==true)?'Airplane Mode':'JIO 4G'),
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
                createTab(Colors.redAccent, CupertinoIcons.bell_solid,
                    'Notifications',''),
                addLine(),
                createTab(Colors.red, CupertinoIcons.volume_up, 'Sounds & Haptics',''),
                addLine(),
                createTab(
                    const Color(0x3E5A38E8), CupertinoIcons.moon_fill, 'Focus',''),
                addLine(),
                createTab(const Color(0xB50202BD), CupertinoIcons.hourglass,
                    'Screen Time',''),
          ],
        ),
      ),
                const SizedBox(height: 40,),
                Card(
                    color: kTileColor,
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: createTab(Colors.grey, CupertinoIcons.settings, 'General','')),

              ],
            ),
        ),
      );
  }
}



