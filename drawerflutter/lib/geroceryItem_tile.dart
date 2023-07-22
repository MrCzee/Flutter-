import 'package:drawerflutter/cart_page.dart';
import 'package:flutter/material.dart';

class GeroceryItem extends StatelessWidget {
  final String ntemname;
  final String itemprice;
  final String imagepath;
  final color;
  void Function()? onPressed;

   GeroceryItem({
    super.key,
    required this.ntemname,
    required this.itemprice,
    required this.imagepath,
    required this.color,
     required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
         onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CartPage(),));
         },
         backgroundColor: Colors.brown,
         child: Icon(Icons.shopping_bag_outlined),
       ),
      body: Padding(

        padding: const EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 200,
            width: 140,
            decoration: BoxDecoration(
              color: color[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset(imagepath,
                  height: 64,),
                ),
                Text(ntemname.toString()),
                MaterialButton(
                  onPressed: onPressed,
                  color: color,
                  child: Text('\$$itemprice'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
