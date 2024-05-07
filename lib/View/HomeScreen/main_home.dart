import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jibica_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibica_plexus/CustomWidget/secondpart.dart';
import 'package:jibica_plexus/CustomWidget/sfastpaet.dart';
import 'package:jibica_plexus/CustomWidget/thirduppart.dart';
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

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(5, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }
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
              FastOartScreen(),
              SecondhomePartScreen(),
              SizedBox(height: 15,),
              Container(
                height: 300,
                width: double.infinity,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex:1,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 100 ,child: Row(
                          children: [
                            ThirdFastPart(
                              name: "Payable",
                              mony: '150',
                              parpose: "Manpower",
                            ),
                            ThirdFastPart(
                              name: "Daily",
                              mony: '1500',
                              parpose: "Salary",
                            ),
                            ThirdFastPart(
                              name: "Cumulative",
                              mony: '1500',
                              parpose: "Salary bd",
                            ),
                            Container(

                            height: 100,
                            width: 80,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(11),
                                topLeft: Radius.circular(11)
                            ),
                            color: Colors.white,
                            border: Border(


                            ),
                                                          ),
                                                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: defaultBackgroundColor
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(Icons.calendar_month)),
                              CustomText(text: "Jun 2024", fontSize: 14, fontWeight: FontWeight.w600)

                            ],
                                                          ),
                                                        )
                          ],
                        ),
                        )
                    ),
                    Expanded(
                        flex:2,
                        child: Container(
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 1.6,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: BarChart(
                                    BarChartData(
                                      maxY: 20,
                                      barTouchData: BarTouchData(
                                        touchTooltipData: BarTouchTooltipData(
                                          getTooltipColor: ((group) {
                                            return Colors.grey;
                                          }),
                                          getTooltipItem: (a, b, c, d) => null,
                                        ),
                                        touchCallback: (FlTouchEvent event, response) {
                                          if (response == null || response.spot == null) {
                                            setState(() {
                                              touchedGroupIndex = -1;
                                              showingBarGroups = List.of(rawBarGroups);
                                            });
                                            return;
                                          }

                                          touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                                          setState(() {
                                            if (!event.isInterestedForInteractions) {
                                              touchedGroupIndex = -1;
                                              showingBarGroups = List.of(rawBarGroups);
                                              return;
                                            }
                                            showingBarGroups = List.of(rawBarGroups);
                                            if (touchedGroupIndex != -1) {
                                              var sum = 0.0;
                                              for (final rod
                                              in showingBarGroups[touchedGroupIndex].barRods) {
                                                sum += rod.toY;
                                              }
                                              final avg = sum /
                                                  showingBarGroups[touchedGroupIndex]
                                                      .barRods
                                                      .length;

                                              showingBarGroups[touchedGroupIndex] =
                                                  showingBarGroups[touchedGroupIndex].copyWith(
                                                    barRods: showingBarGroups[touchedGroupIndex]
                                                        .barRods
                                                        .map((rod) {
                                                      return rod.copyWith(
                                                          toY: avg, color: Colors.greenAccent);
                                                    }).toList(),
                                                  );
                                            }
                                          });
                                        },
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        rightTitles: const AxisTitles(
                                          sideTitles: SideTitles(showTitles: false),
                                        ),
                                        topTitles: const AxisTitles(
                                          sideTitles: SideTitles(showTitles: false),
                                        ),
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            getTitlesWidget: bottomTitles,
                                            reservedSize: 42,
                                          ),
                                        ),
                                        leftTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 28,
                                            interval: 1,
                                            getTitlesWidget: leftTitles,
                                          ),
                                        ),
                                      ),
                                      borderData: FlBorderData(

                                        show: false,
                                      ),
                                      barGroups: showingBarGroups,
                                      gridData: const FlGridData(show: false),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 200,
                width: double.infinity,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Center(child: CustomText(text: "Salary camparison Chart Jan-2023", fontSize: 15, fontWeight: FontWeight.w600),),

                    Expanded(
                        flex:2,
                        child: Container(
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 1.6,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: BarChart(
                                    BarChartData(
                                      maxY: 20,
                                      barTouchData: BarTouchData(
                                        touchTooltipData: BarTouchTooltipData(
                                          getTooltipColor: ((group) {
                                            return Colors.grey;
                                          }),
                                          getTooltipItem: (a, b, c, d) => null,
                                        ),
                                        touchCallback: (FlTouchEvent event, response) {
                                          if (response == null || response.spot == null) {
                                            setState(() {
                                              touchedGroupIndex = -1;
                                              showingBarGroups = List.of(rawBarGroups);
                                            });
                                            return;
                                          }

                                          touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                                          setState(() {
                                            if (!event.isInterestedForInteractions) {
                                              touchedGroupIndex = -1;
                                              showingBarGroups = List.of(rawBarGroups);
                                              return;
                                            }
                                            showingBarGroups = List.of(rawBarGroups);
                                            if (touchedGroupIndex != -1) {
                                              var sum = 0.0;
                                              for (final rod
                                              in showingBarGroups[touchedGroupIndex].barRods) {
                                                sum += rod.toY;
                                              }
                                              final avg = sum /
                                                  showingBarGroups[touchedGroupIndex]
                                                      .barRods
                                                      .length;

                                              showingBarGroups[touchedGroupIndex] =
                                                  showingBarGroups[touchedGroupIndex].copyWith(
                                                    barRods: showingBarGroups[touchedGroupIndex]
                                                        .barRods
                                                        .map((rod) {
                                                      return rod.copyWith(
                                                          toY: avg, color: Colors.greenAccent);
                                                    }).toList(),
                                                  );
                                            }
                                          });
                                        },
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        rightTitles: const AxisTitles(
                                          sideTitles: SideTitles(showTitles: false),
                                        ),
                                        topTitles: const AxisTitles(
                                          sideTitles: SideTitles(showTitles: false),
                                        ),
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            getTitlesWidget: bottomTitles,
                                            reservedSize: 42,
                                          ),
                                        ),
                                        leftTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 28,
                                            interval: 1,
                                            getTitlesWidget: leftTitles,
                                          ),
                                        ),
                                      ),
                                      borderData: FlBorderData(

                                        show: false,
                                      ),
                                      barGroups: showingBarGroups,
                                      gridData: const FlGridData(show: false),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Color(0xffc7ded6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(text: "Today's Selection", fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 102,
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 8),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: 205,
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                    top: -4,
                                    left: -4,
                                    child: Container(
                                    margin: EdgeInsets.all(10),
                                    width: 55,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                      color: Colors.red.shade300,
                                     ),

                                  ),),

                                  Positioned(child: Container(
                                    margin: EdgeInsets.all(10),
                                    width: 60,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        image: DecorationImage(image: AssetImage("asset/profile5.PNG"),fit: BoxFit.fill,)
                                    ),

                                  ),),
                                ],
                              ),
                              Expanded(child: Container(
                                padding: EdgeInsets.all(4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   CustomText(text: "Hafizur Rahaman", fontSize: 14, fontWeight: FontWeight.w700)
                                   , Text(  "Dummy text of the printing Lorem and typesetting .Lorem", textAlign: TextAlign.justify ,maxLines: 4,style: GoogleFonts.poppins(
                                      fontSize: 12.2,fontWeight: FontWeight.w500,

                                    ),)
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      },),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomText(text: "20 ", fontSize: 15, fontWeight: FontWeight.w600,color: Colors.red,),
                          CustomText(text: "Person on leave", fontSize: 12, fontWeight: FontWeight.w600,color: Colors.grey,),
                        ],
                      ),
                    ),
                    Container(
                      height: 120,
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 8),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: 80,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Color(0xedecf1ec)
                          ),
                          child: Column(
                            children: [
                              Expanded(child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(image: AssetImage("asset/profile3.PNG"),fit: BoxFit.fill)
                                ),
                              )),
                              CustomText(text: "66799", fontSize: 15, color: barColor,fontWeight: FontWeight.w800,letterSpacing: 0.2,)
                            ],
                          )
                        );
                      },),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 110,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      //  color: Colors.red,
                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("asset/user.png"),fit: BoxFit.fill,)
                          ),
                        ),
                        SizedBox(height: 5,),
                        CustomText(text: "455H", fontSize: 17, fontWeight: FontWeight.bold,letterSpacing: 0.2,color: Colors.white,)
                        ,CustomText(text: "Total Active", fontSize: 11, fontWeight: FontWeight.bold,letterSpacing: 0.2,color: Colors.white,)
                        ,CustomText(text: "Employee", fontSize: 11, fontWeight: FontWeight.bold,letterSpacing: 0.2,color: Colors.white,)
                      ],
                    ),
                  );
                },)
              ),
              SizedBox(height: 100,)

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
  final double width = 7;

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 20,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: barColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: CupertinoColors.destructiveRed,
          width: width,
        ),
      ],
    );
  }


}
