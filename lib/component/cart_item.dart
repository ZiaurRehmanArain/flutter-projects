import 'package:ecom/models/shoe.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Shoe shoe;
  void Function()? onPressed;
  CartItem({super.key, required this.shoe, required this.onPressed});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
          onPressed: widget.onPressed,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
