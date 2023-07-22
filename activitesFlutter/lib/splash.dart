import 'package:flutter/material.dart';

class SplashActivity extends StatelessWidget {
  const SplashActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Splash  Screen')),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => const (),)
              // );
            },
            child: const Text('Splash'),
          ),
        ),
      ),

    );
  }
}
