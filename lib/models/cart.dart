import 'package:ecom/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of sale item
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom Freak',
        price: '236',
        imagePath: 'assets/images/nike_1.png',
        description:
            'the forward-thinking desgin of his latest signature shoe.'),
    Shoe(
        name: 'Air Jordans',
        price: '220',
        imagePath: 'assets/images/nike_2.png',
        description:
            'the forward-thinking desgin of his latest signature shoe.'),
    Shoe(
        name: 'KD Trey',
        price: '200',
        imagePath: 'assets/images/nike_3.png',
        description:
            'the forward-thinking desgin of his latest signature shoe.'),
    Shoe(
        name: 'Kyrie 6',
        price: '240',
        imagePath: 'assets/images/nike_4.png',
        description:
            'the forward-thinking desgin of his latest signature shoe.'),
  ];
  // list of item in user product
  List<Shoe> userCart = [];

  // get list of item for sales
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get list of item of user
  List<Shoe> getUserCart() {
    return userCart;
  }

  // user add item in cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove  item in cart
  void removeItem(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
