import 'package:animate_do/animate_do.dart';
import 'package:booking_app/Screens/AppointmentScreen/Appointment.dart';
import 'package:booking_app/Screens/HomeScreen.dart';
import 'package:booking_app/Screens/ProfileScreen.dart';
import 'package:booking_app/core/constants/assets.dart';
import 'package:booking_app/core/themes/color_const.dart';
import 'package:booking_app/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/home_screen_controller.dart';
import 'NavdrawerScreen.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.put(HomeScreenController());
  List<Widget> _pageOptions = [];

  @override
  void initState() {
    setState(() {
      _pageOptions = [
        HomeScreen(callback),
        AppointmentScreen(
          isfromNav: true,
        ),
        ProfileScreen(),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: isDarkMode()
              ? SvgPicture.asset(
                  Asset.dark_bg,
                  fit: BoxFit.cover,
                )
              : SvgPicture.asset(
                  Asset.bg,
                  fit: BoxFit.cover,
                ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: NavdrawerScreen(),
          key: controller.drawer_key,
          body: Center(
            child: _pageOptions.elementAt(controller.currentPage),
          ),
          resizeToAvoidBottomInset: false,
          extendBody: true,
          bottomNavigationBar: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: FadeInUp(
                  from: 50,
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 5,
                    curve: Curves.bounceInOut,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    duration: Duration(milliseconds: 400),
                    tabBorderRadius: 10,
                    tabBackgroundColor: Colors.black,
                    color: Colors.black,
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.assignment_add,
                        text: 'Appointment',
                      ),
                      GButton(
                        icon: Icons.supervised_user_circle,
                        text: 'Profile',
                      ),
                    ],
                    selectedIndex: controller.currentPage,
                    onTabChange: (index) {
                      setState(() {
                        controller.changeIndex(index);
                        //currentPage = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  void callback(int index) async {
    if (index == 1) {
      setState(() {
        controller.currentPage = index;
      });
    } else {
      setState(() {
        controller.currentPage = index;
      });
    }
  }
}
