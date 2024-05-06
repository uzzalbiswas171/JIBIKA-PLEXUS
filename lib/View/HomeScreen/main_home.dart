import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:jibica_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibica_plexus/constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
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
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: defaultBackgroundColor,
        padding: EdgeInsets.only(left: 15,right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 15,
                    bottom: 15
                ),
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.54)
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
              ),
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.only(
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Stack(
                              children: [
                                Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(11),
                                      topLeft: Radius.circular(11),
                                  ),
                                                        //    color: Colors.greenAccent
                                                          ),
                                                          child: Center(
                                child: CircleAvatar(
                                  radius: 80,
                                 // backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 45,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                        radius: 43,
                                        backgroundColor: Colors.white,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            CustomText(text: "93%", fontSize: 21, fontWeight: FontWeight.bold,letterSpacing: 0.2,color: barColor,),
                                            CustomText(text: "Present", fontSize: 15, fontWeight: FontWeight.bold,letterSpacing: 0.2,color: Colors.black45,),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                                          ),
                                                        ),


                                Positioned(
                                  top: 13,
                                  left: 23,
                                  child: CircularPercentIndicator(
                                    radius: 67.0,
                                    lineWidth: 16.0,
                                    percent: 0.88,
                                    backgroundColor: Colors.grey.withOpacity(0),
                                    progressColor: Colors.red,
                                  ),),


                                Positioned(
                                  top: 13,
                                  left: 23,
                                  child: CircularPercentIndicator(
                                    radius: 67.0,
                                    lineWidth: 16.0,
                                    percent: 0.95,
                                    backgroundColor: Colors.grey.withOpacity(0),
                                    progressColor: Colors.yellow,
                                  ),),

                                Positioned(
                                  top: 10,
                                  left: 20,
                                  child: CircularPercentIndicator(
                                    radius: 70.0,
                                    lineWidth: 20.0,
                                    percent: 0.8,
                                    backgroundColor: Colors.grey.withOpacity(0),
                                    progressColor: barColor,
                                  ),),

                              ],
                            )),
                        ///Second part start
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(11),
                                bottomRight: Radius.circular(11),
                              ),
                             // color: Colors.grey
                          ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top:8.0),
                                          child: CustomText(text: "${selected2Datee}", fontSize: 13, fontWeight: FontWeight.w700),
                                        ),
                                        IconButton(onPressed: () {
                                          _select2Date(context);
                                        }, icon: Icon(Icons.calendar_month,size: 18,)),
                    
                    
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 22,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            CustomText(text: "P", fontSize: 22, fontWeight: FontWeight.w600,letterSpacing: 0.2,color: barColor,),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: CustomText(text: "resent", fontSize: 15, fontWeight: FontWeight.w600,letterSpacing: 0.2,color: Colors.grey,),
                                            ),
                                          ],
                                        )),

                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Spacer(),
                                            Container(height: 16,width: 2.5,color: Colors.grey.shade400,)
                                            ,Spacer(),
                                            CustomText(text: "155", fontSize: 22, fontWeight: FontWeight.w600,letterSpacing: 0.2,color: barColor,),
                                            Spacer(),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 22,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            CustomText(text: "A", fontSize: 22, fontWeight: FontWeight.w600,letterSpacing: 0.2,color: Colors.red.shade300,),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: CustomText(text: "bsent", color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                                            ),
                                          ],
                                        )),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Spacer(),
                                            Container(height: 16,width: 2.5,color: Colors.grey.shade400,)
                                            ,Spacer(),
                                            CustomText(text: "155", fontSize: 22, fontWeight: FontWeight.w600,letterSpacing: 0.2,color: Colors.red.shade300),
                                            Spacer(),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 22,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            CustomText(text: "L", fontSize: 22, fontWeight: FontWeight.w600,letterSpacing: 0.2,color: barColor.withOpacity(0.5),),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: CustomText(text: "eave",color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                                            ),
                                          ],
                                        )),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Spacer(),
                                            Container(height: 16,width: 2.5,color: Colors.grey.shade400,)
                                            ,Spacer(),
                                            CustomText(text: "155", fontSize: 22, fontWeight: FontWeight.w600,letterSpacing: 0.2,color: barColor.withOpacity(0.5),),
                                            Spacer(),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 22,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            CustomText(text: "H", fontSize: 22, fontWeight: FontWeight.w600,letterSpacing: 0.2,color: Colors.indigo.withOpacity(0.7),),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: CustomText(text: "oliDay",color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                                            ),
                                          ],
                                        )),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Spacer(),
                                            Container(height: 16,width: 2.5,color: Colors.grey.shade400,)
                                            ,Spacer(),
                                            CustomText(text: "155", fontSize: 22, fontWeight: FontWeight.w600,letterSpacing: 0.2,color:  Colors.indigo.withOpacity(0.7),),
                                            Spacer(),
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        CustomText(text: "Active Manpower   ", fontSize: 16,color: Colors.grey, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                        CustomText(text: "8883", fontSize: 18,color: Colors.red.shade300, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                      ],
                    )
                  ],
                ),
              ),

               

            ],
          ),
        ),
      ),
    );
  }
  int selected_index=0;
  String selected2Datee = DateFormat.yMMMEd().format(DateTime.now()).toString();
  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat.yMMMEd();
      setState(() {
        selected2Datee =df.format(picked);
      });
    }
  }
}
