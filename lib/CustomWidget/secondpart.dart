import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constant.dart';
import 'CustomText/custom_text.dart';



class SecondhomePartScreen extends StatefulWidget {
  const SecondhomePartScreen({Key? key}) : super(key: key);

  @override
  State<SecondhomePartScreen> createState() => _SecondhomePartScreenState();
}

class _SecondhomePartScreenState extends State<SecondhomePartScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.only(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Stack(
                    alignment: Alignment.center,
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
                            backgroundColor: Colors.white,
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
                                      CustomText(
                                        text: "93%",
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.2,
                                        color: barColor,
                                      ),
                                      CustomText(
                                        text: "Present",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.2,
                                        color: Colors.black45,
                                      ),
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
                         // left: 23,
                        child: CircularPercentIndicator(
                          radius: 67.0,
                          lineWidth: 16.0,
                          percent: 1,
                          backgroundColor: Colors.grey.withOpacity(0),
                          progressColor: Colors.indigo,
                        ),
                      ),
                      Positioned(
                        top: 13,
                      //  left: 23,
                        child: CircularPercentIndicator(
                          radius: 67.0,
                          lineWidth: 16.0,
                          percent: 0.95,
                          backgroundColor: Colors.grey.withOpacity(0),
                          progressColor: Colors.yellow,
                        ),
                      ),
                      Positioned(
                        top: 13,
                     //   left: 23,
                        child: CircularPercentIndicator(
                          radius: 67.0,
                          lineWidth: 16.0,
                          percent: 0.88,
                          backgroundColor: Colors.grey.withOpacity(0),
                          progressColor: Colors.red,
                        ),
                      ),
                      Positioned(
                        top: 10,
                    //    left: 20,
                        child: CircularPercentIndicator(
                          radius: 70.0,
                          lineWidth: 20.0,
                          percent: 0.8,
                          backgroundColor: Colors.grey.withOpacity(0),
                          progressColor: barColor,
                        ),
                      ),
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
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CustomText(
                                      text: "${selected2Datee}",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                                IconButton(
                                    onPressed: () {
                                      _select2Date(context);
                                    },
                                    icon: Icon(
                                      Icons.calendar_month,
                                      size: 18,
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
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: "P",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          color: barColor,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 5.0),
                                          child: CustomText(
                                            text: "resent",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.2,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 16,
                                          width: 2.5,
                                          color: Colors.grey.shade400,
                                        ),
                                        Spacer(),
                                        CustomText(
                                          text: "155",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          color: barColor,
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 22,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: "A",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          color: Colors.red.shade300,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 5.0),
                                          child: CustomText(
                                            text: "bsent",
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 16,
                                          width: 2.5,
                                          color: Colors.grey.shade400,
                                        ),
                                        Spacer(),
                                        CustomText(
                                            text: "155",
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.2,
                                            color: Colors.red.shade300),
                                        Spacer(),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 22,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: "L",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          color: barColor.withOpacity(0.5),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 5.0),
                                          child: CustomText(
                                            text: "eave",
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 16,
                                          width: 2.5,
                                          color: Colors.grey.shade400,
                                        ),
                                        Spacer(),
                                        CustomText(
                                          text: "155",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          color: barColor.withOpacity(0.5),
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 22,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: "H",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          color: Colors.indigo.withOpacity(0.7),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 5.0),
                                          child: CustomText(
                                            text: "oliDay",
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 16,
                                          width: 2.5,
                                          color: Colors.grey.shade400,
                                        ),
                                        Spacer(),
                                        CustomText(
                                          text: "155",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                          color: Colors.indigo.withOpacity(0.7),
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                CustomText(
                  text: "Active Manpower   ",
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
                CustomText(
                  text: "8883",
                  fontSize: 18,
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  int selected_index = 0;
  String selected2Datee = DateFormat.yMMMEd().format(DateTime.now()).toString();

  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat.yMMMEd();
      setState(() {
        selected2Datee = df.format(picked);
      });
    }
  }
}
