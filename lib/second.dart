import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tableview_flut/constant.dart';
import 'package:tableview_flut/preferences.dart';
import 'package:tableview_flut/createtab.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int flag=0;
  final scroll = ScrollController();
  XFile? imgFile;


  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero,()async
    {
      await UserPreferences.init();
      //imgFile?.path=await UserPreferences.getval();
    });
    scroll.addListener(() {
      if(scroll.position.pixels >= scroll.position.maxScrollExtent){
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
    scroll.dispose();
  }
  Future<void> setImage(String val)async{
    ImagePicker imagePicker =ImagePicker();

      if (await Permission.storage
          .request()
          .isGranted) {
        imgFile = await imagePicker.pickImage(source: (val=='1')?ImageSource.camera:ImageSource.gallery);
        setState(() {
          imgFile;
           // Future.delayed(Duration.zero,()async{
           //   await UserPreferences.setval(imgFile!.path);
           // });
        });
    }
  }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.maybePop(context);
      },icon: const Icon(CupertinoIcons.back),
        color: Colors.blueAccent,
      ),
        backgroundColor: const Color(0xFF212121),title: const Text('Apple ID'),centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        controller: scroll,
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Align(
          alignment: const FractionalOffset(0.5,0.5),
          child: CircleAvatar(backgroundImage: imgFile == null ? const AssetImage('assets/cartoon.jpeg'):FileImage(File(imgFile!.path)) as ImageProvider,radius: 50,
             // FileImage(File(imgFile!.path.toString())) as ImageProvider
          child: Align(
            alignment: const FractionalOffset(0.9,0.9),
            child: InkWell(
              onTap: (){
               //setImage();
                showDialog(context: context, builder: (ctx) => CupertinoAlertDialog(
                  title: const Text("Pick Image from"),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(child: const Text('Camera'),onPressed: (){
                        setImage('1');
                        Navigator.pop(context);
                      },),
                      CupertinoDialogAction(child: const Text('Gallery'),onPressed: (){
                        setImage('0');
                        Navigator.pop(context);
                      },),
                    ],
                ));
              },
              //
              child: Container(
                height: 15,
                width: 90,
                color: Colors.black26,
                child: const Text('EDIT',textAlign: TextAlign.center,),
              ),
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
      mainAxisAlignment: MainAxisAlignment.start,
    children: [
      createTab(Colors.lightBlueAccent, CupertinoIcons.cloud_fill, 'iCloud','5GB'),
          addLine(65),
      createTab(Colors.lightBlueAccent.shade700, CupertinoIcons.double_music_note, 'Media & Purchases',''),
          //makeTile('Media & Purchases',CupertinoIcons.double_music_note),
          addLine(65),
      createTab(Colors.redAccent, Icons.navigation_sharp, 'Find My',''),
          //makeTile('Find My',Icons.navigation_sharp),
          addLine(65),
      createTab(Colors.lightGreen, CupertinoIcons.person_2_fill, 'Find My','Learn more...'),
          //makeTile('Family Sharing',CupertinoIcons.person_2_fill),
    ],
    ),
    ),
          const SizedBox(height: 20,),
          // Some Code to go here
          //think it
          (flag==0) ? ListTile(
            tileColor: Colors.grey[850],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const SizedBox(
              height: 40,
              width: 10,
                child: Center(child: CupertinoActivityIndicator()))
          ) : Card(
            color: kTileColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                createimag('assets/iphone.jpeg', 'iPhone SE 2020', 'This iPhone SE'),
                addLine(65),
                createimag('assets/iphone6s.webp', 'apple\'s iphone', 'iPhone 6s'),
                addLine(65),
                createimag('assets/ipad.png', 'iPad', 'iPad'),
                addLine(65),
                createimag('assets/Ipad.jpeg', 'iPad', 'iPad'),
                addLine(65),
                createimag('assets/macpro.jpeg', 'Karanpreet\'s MacBook Pro', 'MacBook Pro 13"'),
                addLine(65),
                createimag('assets/macpro.jpeg', 'Macbook\'s MacBook Pro', 'MacBook Pro 15"'),
                addLine(65),
                createimag('assets/macpro.jpeg', 'Palak\'s MacBook Pro', 'MacBook Pro 16"'),
                addLine(65),
                createimag('assets/macpro.jpeg', 'Mridul\'s MacBook Pro', 'MacBook Pro 13"'),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Card(
              color: kTileColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: const ListTile(
                title: Text('Sign Out',style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
              ),
          ),
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