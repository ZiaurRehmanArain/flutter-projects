import 'package:ecom/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(
              'assets/images/nike_logo.png',
              height: 240,
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          const Text(
            'Just Do It',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Brand new sneakers and custom kicks made with premium quality',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(height: 48,),
          GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage())),
            child: Container(
              padding:const EdgeInsets.all(25),
              margin:const EdgeInsets.all(25),
              decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius:const BorderRadius.all(Radius.circular(10))
            
              ),
              child:const Center(child: Text('Shop Now',style: TextStyle(color: Colors.white),)) ,),
          )
        ],
      ),
    );
  }
}
