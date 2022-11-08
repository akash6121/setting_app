import 'package:flutter/material.dart';
import 'package:tableview_flut/constant.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int flag=0;
  final Scroll = ScrollController();
  List<Widget> itemsp = [];

  @override
  void initState(){
    super.initState();
    Scroll.addListener(() {
      if(Scroll.position.pixels >= Scroll.position.maxScrollExtent){
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              flag=1;
            }); // Prints after 1 second.
          });
      }
    });
  }
  @override
  void dispose(){
    super.dispose();
    Scroll.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Widget addLine(double val){
      return Divider(height: 0, thickness: 1, endIndent: 10, indent: val,);
    }
    Widget makeTile(String text,[IconData? icon]){
      return ListTile(
        leading: (icon!=null) ? Icon(icon):Text(text),
        title: (icon!=null) ? Text(text):null,
        contentPadding: const EdgeInsets.all(15),
        // tileColor: Colors.grey[850],
        visualDensity: const VisualDensity(vertical: -4),
        trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 17,));
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF212121),title: const Text('Apple ID'),centerTitle: true,),
      body: ListView(
        controller: Scroll,
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Align(
          alignment: const FractionalOffset(0.5,0.5),
          child: CircleAvatar(backgroundImage: const AssetImage('assets/cartoon.jpeg'),radius: 50,
          child: Align(
            alignment: const FractionalOffset(0.9,0.9),
            child: Container(
              height: 15,
              width: 90,
              color: Colors.black26,
              child: const Text('EDIT',textAlign: TextAlign.center,),
            ),
          ),),
        ),
          const SizedBox(height: 10,),
          Text('Satguru Technologies',style: KTextStyle(30.0),textAlign: TextAlign.center,maxLines: 2,),
          const Text('satgurutechnologies12@gmail.com',textAlign: TextAlign.center,),
          const SizedBox(height: 20,),
          Card(
            color: kTileColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                makeTile('Name,Phone Numbers,Email'),
                addLine(7),
                makeTile('Password & Security'),
                addLine(7),
                makeTile('Payment & Shipping'),
                addLine(7),
                makeTile('Subscription'),
              ],
            ),
          ),
          const SizedBox(height: 40,),
    Card(
    color: kTileColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Column(
    children: [
          makeTile('iCloud',Icons.cloud),
          addLine(45),
          makeTile('Media & Purchases',Icons.media_bluetooth_on),
          addLine(45),
          makeTile('Find My',Icons.navigation_sharp),
          addLine(45),
          makeTile('Family Sharing',Icons.people_alt_rounded),
    ],
    ),
    ),
          const SizedBox(height: 20,),
          // Some Code to go here
          //think it
          (flag==0) ? ListTile(
            tileColor: Colors.grey[850],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Container(
              height: 40,
              width: 10,
                child: Center(child: CircularProgressIndicator(color: Colors.grey,)))
          ) : Card(
            color: kTileColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                makeTile('iPhone SE 2020',Icons.phone_iphone_outlined),
                addLine(45),
                makeTile('apple\'s iphone',Icons.phone_iphone_outlined),
                addLine(45),
                makeTile('ipad',Icons.tablet_mac),
                addLine(45),
                makeTile('iPad',Icons.tablet_mac),
                addLine(45),
                makeTile('Karanpreet\'s MacBook Pro',Icons.laptop_mac),
                addLine(45),
                makeTile('Macbook\'s MacBook Pro',Icons.laptop_mac),
                addLine(45),
                makeTile('Palak\'s MacBook Pro',Icons.laptop_mac),
                addLine(45),
                makeTile('Mridul\'s MacBook Pro',Icons.laptop_mac),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Card(
              color: kTileColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: makeTile('Sign Out',Icons.logout)),
    ]
      ),
    );
  }
}
// const SpinKitCircle(
// color: Colors.grey,
// ),
// tileColor: Colors.grey[850],
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),