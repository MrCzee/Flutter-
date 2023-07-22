import 'package:flutter/material.dart';
import 'package:sqlite/product_list.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 38.0, left: 18, right: 18),
            child: Image(
              image: NetworkImage('https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),),
          ),
          const SizedBox(
            height:20 ,
          ),
          const Text('The way you see me.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 20,
          ),
          Container(

            decoration:const  BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.green,
            ),
            child: TextButton(

                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Sqlite(),));
                },
                child: const Text('data')
            ),
          )
        ],
      ) ,
    );
  }
}
