import 'package:ecom/component/cart_item.dart';
import 'package:ecom/models/cart.dart';
import 'package:ecom/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  void removeItem(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).removeItem(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Card',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (BuildContext context, int index) {
                  Shoe individualUserShoe = value.getUserCart()[index];
                  return CartItem(
                    shoe: individualUserShoe,
                    onPressed: () => removeItem(individualUserShoe),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
