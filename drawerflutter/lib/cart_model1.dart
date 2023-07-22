import 'package:flutter/material.dart';

class Carts extends ChangeNotifier{
 final List shopitems = [
   //[item_name,itemPrice, imagePath, color]

   ["avacado","12.4", "lib/images/avocado.png", Colors.green],
   ["banana","12.4", "lib/images/banana.png", Colors.amberAccent],
   ["chicken","12.4", "lib/images/chicken.png", Colors.brown],
   ["water","12.4", "lib/images/water.png", Colors.blue],

 ];
 final List cart_items = [];
 get shopitems_ =>shopitems;
 get cart_items_ =>cart_items;

 // add carts
void addItemsToCart(int index)
{
 cart_items.add(shopitems[index]);
 notifyListeners();
}
// remove carts
void removeItemsFromCart(int index)
{
 cart_items.removeAt(index);
 notifyListeners();
}
// calculate carts
String Calculations()
{
 double totalPrice = 0.0;
 for(int i =0 ; i<cart_items.length;i++)
  {
    // t = t+cart[i][1]
   totalPrice+= double.parse(cart_items[i][1]);
    notifyListeners();
  }
 return  totalPrice.toString();
}

}