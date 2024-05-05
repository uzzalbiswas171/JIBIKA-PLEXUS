
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../CustomWidget/CustomAppbar/custom_appbar.dart';
import '../../constant.dart';
import 'main_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage:2);

  /// Controller to handle bottom nav bar and also handles initial page
  var _controller = NotchBottomBarController(index: 2);

  int maxCount = 5;
  bool is_get_profie=false;
  dynamic getDynamicSliderData;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
@override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  /// widget list
  final List<Widget> bottomBarPages = [

    Text(""),
    Text(""),
    MainHomeScreen(),
    Text(""),
    Text(""),



  ];
final _scaffoldkey=GlobalKey<ScaffoldState>();

int Select_index=0;
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () { return Future(() => false); },
      child: Scaffold(

        appBar: PreferredSize(preferredSize: Size.fromHeight(70), child: CustomAppbar(
          onTap: () {
            _scaffoldkey.currentState!.openDrawer();
          },
        ),
        ),
        key: _scaffoldkey,
        drawer: Drawer(
          backgroundColor:  Colors.white,
          child: Column(
            children: [
              DrawerHeader(child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: DecorationImage(image: AssetImage("asset/gprojukti.png"),fit: BoxFit.fill)
                ),
              ))
            ],
          ),
        ),

        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
          /// Provide NotchBottomBarController
          notchBottomBarController: _controller,
       //   color: redColor,
          color: logocolor,
          showLabel: false,
          shadowElevation:9,
          kBottomRadius: 28.0,
          notchColor: logocolor,
          /// restart app if you change removeMargins
          removeMargins: false,
          bottomBarWidth: double.infinity,
          showShadow: false,
          durationInMilliSeconds: 300,
          elevation: 1,
          bottomBarItems:  [

            BottomBarItem(
              inActiveItem: Icon(Icons.home_filled,size: 25,color: Colors.white,),
              activeItem:  Icon(Icons.home_filled,size: 25,color: Colors.white,),
              itemLabel: 'Page 1',
            ),

            BottomBarItem(
              inActiveItem: Icon(Icons.fingerprint,size: 25,color: Colors.white,),
              activeItem:  Icon(Icons.fingerprint,size: 25,color: Colors.white,),
              itemLabel: 'Page 1',
            ),


            BottomBarItem(
              inActiveItem: Image.asset("asset/leave.png",height: 25,width: 25,color: Colors.white,),
              activeItem: Image.asset("asset/leave.png",height: 25,width: 25,color: Colors.white,),
              itemLabel: 'Page 2',
            ),

            BottomBarItem(
              inActiveItem: Icon(Icons.computer_outlined,size: 25,color: Colors.white,),
              activeItem:  Icon(Icons.computer_outlined,size: 25,color: Colors.white,),
              itemLabel: 'Page 1',
            ),

            BottomBarItem(
              inActiveItem: Icon(Icons.track_changes,size: 25,color: Colors.white,),
              activeItem:  Icon(Icons.track_changes,size: 25,color: Colors.white,),
              itemLabel: 'Page 1',
            ),




          ],
          onTap: (index) {
            if(index==0 ){
              _pageController.jumpToPage(0);

            } else if(index==2){
              _pageController.jumpToPage(2);
            }else{
              _pageController.jumpToPage(1);
            }
          },
          kIconSize: 24.0,
        )
            : null,
      ),
    );
  }
}
