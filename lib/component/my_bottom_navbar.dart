import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavbar extends StatelessWidget {
  Function(int)? onTabChange;
  MyBottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopify_rounded,
            text: 'Cart',
          ),
        ]);
  }
}
