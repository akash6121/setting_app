import 'package:flutter/material.dart';
import 'package:tableview_flut/constant.dart';
Widget createtopTab(Color colour, IconData icon, String s){
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: ListTile(
      tileColor: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
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
      trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
    ),
  );
}
Widget createbotTab(Color colour, IconData icon, String s){
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: ListTile(
      tileColor: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
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
      trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
    ),
  );
}