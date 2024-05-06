

import 'package:flutter/material.dart';
import 'package:jibica_plexus/CustomWidget/CustomText/custom_text.dart';

class ThirdFastPart extends StatefulWidget {
   ThirdFastPart({Key? key,required this.name,required this.mony,required this.parpose}) : super(key: key);
  String  name;
  String mony;
  String  parpose;
   @override
   State<ThirdFastPart> createState() => _ThirdFastPartState();
 }

 class _ThirdFastPartState extends State<ThirdFastPart> {
   @override
   Widget build(BuildContext context) {
     return Expanded(child: Container(
       height: 100,
       width: 100,
       padding: EdgeInsets.all(5),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(11),
             topLeft: Radius.circular(11)
         ),
         color: Colors.white,
         border: Border(
           right: BorderSide(width: 2, color: Colors.grey,style: BorderStyle.solid),
         ),
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           CustomText(text: "${widget.name}", fontSize: 15, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
           CustomText(text: "${widget.mony}", fontSize: 22, fontWeight: FontWeight.bold,letterSpacing: 0.2,color: Colors.grey,),
           CustomText(text: "${widget.parpose}", fontSize: 16, fontWeight: FontWeight.w600,letterSpacing: 0.2,color: Colors.grey,),
         ],
       ),
     ));
   }
 }
