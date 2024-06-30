import 'package:ecom/component/shoe_tile.dart';
import 'package:ecom/models/cart.dart';
import 'package:ecom/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToShoeList(shoe) {
    Provider.of<Cart>(context,listen: false).addItemToCart(shoe);

    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Succesfully add item'),
            content: Text('Congratuation'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'everyone files... some fly longer then other',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hots Picks 🔥',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.shoeShop.length,
              itemBuilder: (BuildContext context, int index) {
                Shoe shoe = value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addToShoeList(shoe),
                );
              },
            ),
          ),
          //  const Padding(padding: EdgeInsets.only(top: 12,right: 12,bottom: 12),
          //   child: Divider(),)
        ],
      ),
    );
  }
}
