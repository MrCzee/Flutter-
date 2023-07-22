import 'package:activitesflutter/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      drawer: Drawer(
        child: ListView(children: const [

          UserAccountsDrawerHeader(
              accountName: Text('Imran khan lashari'),
              accountEmail: Text('imranahmedlashari21@gmail.com')),
        ]),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SplashActivity()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        backgroundColor: Colors.purpleAccent,

      ),
      body: Column(
        children:  [
          Center(
            child: ElevatedButton(
              onPressed: () {

              },
              child: const Text('Go back!'),


            ),
          ),

        ]
        ,),
    );
  }
}

