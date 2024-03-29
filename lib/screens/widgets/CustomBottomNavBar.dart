import 'package:dairy_industry_conference/screens/contact/ContactScreen.dart';
import 'package:dairy_industry_conference/screens/event_details/EventDetailsScreen.dart';
import 'package:dairy_industry_conference/screens/exhibitor_list/ExhibitorListScreen.dart';
import 'package:dairy_industry_conference/screens/venue/VenueScreen.dart';
import 'package:dairy_industry_conference/screens/widgets/BottomMenuItem.dart';
import 'package:dairy_industry_conference/utils/enums.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: MenuState.home == selectedMenu
                  ? BottomMenuItem(
                      iconPath: 'assets/images/home_on.png', label: 'Home', textColor: const Color(0xff272974))
                  : BottomMenuItem(
                      iconPath: 'assets/images/home_off.png', label: 'Home', textColor: Colors.grey),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            GestureDetector(
              child: MenuState.event == selectedMenu
                  ? BottomMenuItem(
                  iconPath: 'assets/images/connect_on.png', label: 'Ev details', textColor: const Color(0xff272974))
                  : BottomMenuItem(
                  iconPath: 'assets/images/connect_off.png', label: 'Ev details', textColor: Colors.grey),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => EventDetailsScreen()));
              },
            ),
            GestureDetector(
              child: MenuState.exhibition == selectedMenu
                  ? BottomMenuItem(
                  iconPath: 'assets/images/exhibitor_on.png', label: 'Ex List', textColor: const Color(0xff272974))
                  : BottomMenuItem(
                  iconPath: 'assets/images/exhibitor_off.png', label: 'Ex List', textColor: Colors.grey),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ExhibitorListScreen()));
              },
            ),
            GestureDetector(
              child: MenuState.venue == selectedMenu
                  ? BottomMenuItem(
                  iconPath: 'assets/images/details_on.png', label: 'Venue', textColor: const Color(0xff272974))
                  : BottomMenuItem(
                  iconPath: 'assets/images/details_off.png', label: 'Venue', textColor: Colors.grey),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => VenueScreen()));
              },
            ),
            GestureDetector(
              child: MenuState.contact == selectedMenu
                  ? BottomMenuItem(
                  iconPath: 'assets/images/contact_on.png', label: 'Contact', textColor: const Color(0xff272974))
                  : BottomMenuItem(
                  iconPath: 'assets/images/contact_off.png', label: 'Contact', textColor: Colors.grey),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ContactScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
