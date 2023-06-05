import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();
  int a = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: const Center(child: Text('Lottery App')),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Center(
                child: Text(
              'Lottery number is 4',
              style: TextStyle(fontSize: 24, color: Colors.white),
            )),
            //Text(a > 5 ? 'You lost' : 'you wont'),
            const SizedBox(
              height: 22,
            ),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: a == 4
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.done_all,
                            size: 32,
                            color: Colors.purpleAccent,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Congratulations You won the lottery\n\n ',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.error,
                            size: 32,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text('Oops You lose'),
                        ],
                      ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Center(
              child: Text(
                'Your Guessed Number $a\n\n Play Again',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            a = random.nextInt(6);
           // print(a);
            setState(() {});
            //  print(random.nextInt(5));
          },
          child: Icon(a < 5 ? Icons.plus_one : Icons.refresh),
        ),
      ),
    );
  }
}
