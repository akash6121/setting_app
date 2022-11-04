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
        setState(() {
          flag=1;
        });
        print('reach');
      }
    });
  }
  void dispose(){
    super.dispose();
    Scroll.dispose();
  }// await(future.delay(milisecond:300);
  Widget build(BuildContext context) {
    Widget makeTile(String text,[IconData? icon]){
      return ListTile(
        leading: (icon!=null) ? Icon(icon):Text(text),
        title: (icon!=null) ? Text(text):null,
        contentPadding: EdgeInsets.all(15),
        tileColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        visualDensity: VisualDensity(vertical: -4),
        trailing: Icon(Icons.arrow_forward_ios),);
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF212121),title: Text('Apple ID'),centerTitle: true,),
      body: ListView(
        controller: Scroll,
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
          SizedBox(height: 40,),
          makeTile('iCloud',Icons.cloud),
          makeTile('Media & Purchases',Icons.media_bluetooth_on),
          makeTile('Find My',Icons.navigation_sharp),
          makeTile('Family Sharing',Icons.people_alt_rounded),
          SizedBox(height: 20,),
          // Some Code to go here
          //think it
          (flag==0) ? CircularProgressIndicator() : Column(
            children: <Widget>[
              makeTile('iPhone SE 2020',Icons.phone_iphone_outlined),
              makeTile('apple\'s iphone',Icons.phone_iphone_outlined),
              makeTile('ipad',Icons.tablet_mac),
              makeTile('iPad',Icons.tablet_mac),
              makeTile('Karanpreet\'s MacBook Pro',Icons.laptop_mac),
              makeTile('Macbook\'s MacBook Pro',Icons.laptop_mac),
              makeTile('Palak\'s MacBook Pro',Icons.laptop_mac),
              makeTile('Mridul\'s MacBook Pro',Icons.laptop_mac),
            ],
          ),
          SizedBox(height: 20,),
          makeTile('Sign Out',Icons.logout),
    ]
      ),
    );
  }
}
