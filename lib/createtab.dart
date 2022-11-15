import 'package:flutter/material.dart';
import 'package:tableview_flut/constant.dart';
Widget createTab(Color colour, IconData icon, String s,String place){
  return ListTile(
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
    title: Row(
      children: [
        Text(s,style: KTextStyle(18.0),),
        Spacer(),
        Text(place,style: TextStyle(color: Colors.grey[400]),),
      ],
    ),
    trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 17,),
  );
}