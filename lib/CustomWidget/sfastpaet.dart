import 'package:flutter/material.dart';

import '../constant.dart';
import 'CustomText/custom_text.dart';

class FastOartScreen extends StatefulWidget {
  const FastOartScreen({Key? key}) : super(key: key);

  @override
  State<FastOartScreen> createState() => _FastOartScreenState();
}

class _FastOartScreenState extends State<FastOartScreen> {
  int selected_index=0;
  List countList=[
    "Employee",
    "attendance",
    "Leave",
    "Loan",
  ];
  List listimage=[
    "asset/right.png",
    "asset/fingerprint.png",
    "asset/airplane.png",
    "asset/debt.png",
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(
          top: 15,
          bottom: 15
      ),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          border: Border.all(
              color: Colors.grey
          )
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:countList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selected_index=index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 5),
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 3, color:selected_index==index?Colors.grey :Colors.grey.withOpacity(0.0),style: BorderStyle.solid),
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(

                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset("${listimage[index]}",fit: BoxFit.fill,color: appbarBackgroundcollor,),
                          )),
                      CustomText(text: "${countList[index]}", fontSize: 16, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                    ],
                  ),
                  Positioned(
                      top: 0,
                      right:5,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: defaultBackgroundColor,
                        child: CustomText(text: "20", fontSize: 9, fontWeight: FontWeight.w600,color: Colors.red.shade300,),
                      ))
                ],
              ),
            ),
          );
        },),
    );
  }
}
