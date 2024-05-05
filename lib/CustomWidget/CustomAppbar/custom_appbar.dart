 import 'package:flutter/material.dart';
import 'package:jibica_plexus/CustomWidget/CustomText/custom_text.dart';

import 'package:provider/provider.dart';

import '../../constant.dart';
import '../CustomTExtFormField/custom_text_formfield.dart';

class CustomAppbar extends StatefulWidget {
   CustomAppbar({super.key , this.onTap});
  final GestureTapCallback? onTap;
  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: logocolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)
        )
      ),
      child: AppBar(
        backgroundColor: logocolor,
        leading: InkWell(
          onTap: widget.onTap,
          child: Image.asset("asset/menu.png",height: 15,width: 15,color: Colors.white,)
          ,
        ),

        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(bottom: 5,),
          child:  CustomText(text: "JIBIKA PLEXUS", fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 0.2,)
        ),
        actions: [
          InkWell(
            onTap: () {     },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 15.0,left: 20),
                  child: Icon(Icons.notifications_sharp,color: Colors.white,size: 28,),
                ),

                Positioned(
                   right: 6,
                   top: 5,
                   child: CircleAvatar(
                     backgroundColor: Colors.red,
                     radius: 7,
                     child: Text("1",style: TextStyle(fontSize: 10,color: Colors.white),
                     ),
                   ),
                 ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
                onTap: () {

                },
                child: Icon(Icons.more_vert,color: Colors.white,size: 25,)),
          ),
        ],
      ),
    );
  }

}
