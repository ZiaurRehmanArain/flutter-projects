import 'package:ecom/component/my_bottom_navbar.dart';
import 'package:ecom/pages/card_page.dart';
import 'package:ecom/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  navigateBottomBar(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List pages = [
    const ShopPage(),
    const CardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          );
        }),
      ),
      backgroundColor: Colors.grey.shade300,
      body: pages[selectedIndex],
      bottomNavigationBar: MyBottomNavbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child:
            Column(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: Colors.transparent, width: 0.0),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/nike_logo.png',
                      color: Colors.white,
                    )),
            
                //  const Divider(color: Colors.grey,)
                const ListTile(
                  leading: Icon(Icons.home,color: Colors.white,),
                  title: Text('Home',style: TextStyle(color: Colors.white),),
                ),
                const ListTile(
                  leading: Icon(Icons.info,color: Colors.white,),
                  title: Text('About',style: TextStyle(color: Colors.white),),
                ),
               const Spacer(),
               const ListTile(
                  leading: Icon(Icons.logout,color: Colors.white,),
                  title: Text('Logout',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
             
          
        ),
      );
  }
}
