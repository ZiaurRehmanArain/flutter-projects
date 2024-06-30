import 'package:flutter/material.dart';
import 'package:noteapp/component/drawer_tile.dart';
import 'package:noteapp/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.red,
      child: Column(
        children: [
          //Header
          const DrawerHeader(
              child: Icon(
            Icons.edit,
            // size: 72,
          )),
          DrawerTile(
              title: 'Notes',
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              }),
          DrawerTile(
              title: 'Setting',
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()));
              }),
        ],
      ),
    );
  }
}
