import 'package:industry_conference/screens/home/HomeBody.dart';
import 'package:industry_conference/screens/widgets/CustomAppBar.dart';
import 'package:industry_conference/screens/widgets/CustomBottomNavBar.dart';
import 'package:industry_conference/screens/widgets/CustomDrawer.dart';
import 'package:industry_conference/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  static final String id = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,));
    /*SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Color(0xff1EA0D6)));*/

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext buildContext) {
            return IconButton(
              icon: Image.asset(
                'assets/icons/menu-icon.png', // Your custom drawer icon path
                height: 24, // Adjust the height as needed
              ),
              onPressed: () {
                Scaffold.of(buildContext).openDrawer(); // Open the drawer
              },
            );
          },
        ),
        title: Center(
          child: Image.asset(
            'assets/images/banner.png',
            height: 50,
          ),
        ),
      ),


      drawer: const CustomDrawer(),
      body: const Center(
        child: HomeBody(),
      ),

    );
  }
}