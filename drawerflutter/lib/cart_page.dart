import 'package:drawerflutter/cart_model1.dart';
import 'package:drawerflutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts'),
        centerTitle: true,
      ),
      body: Consumer<Carts>(builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart_items.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(value.cart_items[index][2], height: 32,),
                    subtitle: Text(value.cart_items[index][1]),

                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('\ ' + value.cart_items[index][0]))),
                    ),
                    trailing:  IconButton(
                        onPressed: () {
                           Provider.of<Carts>(context, listen: false).removeItemsFromCart(index);
                        },
                        icon: const Icon(Icons.delete)),
                  );
                },

              ),
            ),
             Padding(
               padding: const EdgeInsets.all(14.0),
               child: Container(
                 decoration:const  BoxDecoration(
                   color: Colors.green,
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                 ),
                 child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                        const  Text(' Total Price', style:  TextStyle(color: Colors.white),),
                        Text(' '+value.Calculations(), style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 12),),

                        ],
                      ),

                    ),
                     ],
            ),
               ),
             )
          ],
        );

      }),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.lightBlue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                 builder: (context) => const HomePage(),
              ));
        },
        backgroundColor: Colors.black26,
        child: const Text('PAY HERE', style: TextStyle(fontSize: 8),)
        //Icon(Icons.skip_next),
      ),
    );
  }
}
