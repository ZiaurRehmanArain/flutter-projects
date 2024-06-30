import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25,right: 25,top: 10),
        padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('change theme',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
        
            CupertinoSwitch(value:Provider.of<ThemeProvider>(context,listen: false).isDartMode , onChanged: (val)=>Provider.of<ThemeProvider>(context,listen: false).toggleThemen())
        ],),
      ),
    );
  }
}