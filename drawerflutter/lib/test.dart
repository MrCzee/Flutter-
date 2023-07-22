import 'package:drawerflutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
        Center(

          child:   Column(
            children: [
              const  Padding(
                  padding: EdgeInsets.only(left: 80, right: 80, top: 80, bottom: 40),
                  child: Image(image: AssetImage('lib/images/avocado.png')),
                ),

                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('We will deliver Groceries at your doorsteps',textAlign : TextAlign.center,
                    style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),

                  ),
                ),


            const Spacer(),
                 GestureDetector(

                   onTap: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                   },
                   child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                       child: const Padding(
                         padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                         child:   Text('get started',textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                       ),
                     ),
                 ),

              const Spacer(),


            ],
          ),
    ),
      );

  }
}
