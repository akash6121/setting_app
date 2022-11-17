import 'package:flutter/material.dart';
import 'package:tableview_flut/constant.dart';
Widget createTab(Color colour, IconData icon, String s,String place){
  return ListTile(
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
        Text(s,style: KTextStyle(18.0),maxLines: 2,),
        Spacer(),
        Text(place,style: TextStyle(color: Colors.grey[400]),overflow: TextOverflow.ellipsis,textAlign: TextAlign.end,),
      ],
    ),
    trailing: const Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 17,),
  );
}
Widget createimag(String imag, String s,String place) {

  return ListTile(
      leading: Image(image: AssetImage(imag),),
      title: Text(s),
      subtitle: Text(place, style: TextStyle(color: Colors.grey),),
      //contentPadding: EdgeInsets.all(15),
// tileColor: Colors.grey[850],
      visualDensity: VisualDensity(vertical: -4),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 17,)
  );
}