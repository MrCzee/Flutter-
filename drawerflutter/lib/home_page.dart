import 'package:drawerflutter/cart_model1.dart';
import 'package:drawerflutter/geroceryItem_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      body:   SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 16),
              child: Text('Good morning.'),
            ),
           const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Lets order fresh vegetables items today.',
                style:  GoogleFonts.mochiyPopOne(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child:  Divider(
                thickness: 3,
                color: Colors.black26,
              ),
            ),
            
           const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child:  Text('Fresh items'),
            ),
            Expanded(
                child: Consumer<Carts>(
                  builder: (context, value, child) {
                    return  GridView.builder(
                      itemCount: value.shopitems.length,
                      padding: const EdgeInsets.all(12),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1/1.3),
                      itemBuilder: (context, index) {
                        return GeroceryItem(
                            ntemname: value.shopitems[index][0],
                            itemprice: value.shopitems[index][1],
                            imagepath: value.shopitems[index][2],
                            color: value.shopitems[index][3],
                            onPressed: () {
                            Provider.of<Carts>(context, listen: false).addItemsToCart(index);
                          },
                        );


                      },
                    );
                  },
               // // \

                )
            ),
          ],
        ),
      ),
    );
  }
}
