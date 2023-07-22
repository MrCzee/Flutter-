import 'package:flutter/material.dart';
import 'package:sqlite/product_list.dart';
import 'package:sqlite/splash.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


Future<void>main() async {
  // Initialize FFI
  sqfliteFfiInit();

  //await WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Sqlite(),
    );
  }
}
