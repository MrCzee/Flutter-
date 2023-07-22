
import 'package:flutter/material.dart';
import 'package:sqlite/helper/DBHelper.dart';
import 'package:sqlite/model/model_dast.dart';

class Sqlite extends StatefulWidget {
  const Sqlite({super.key});

  @override
  State<Sqlite> createState() => _SqliteState();
}

class _SqliteState extends State<Sqlite> {
  late String name, description;
  late double price;

  // create Data

  //  dbHelper.deleteData(name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.lightBlue,
        actions: const [
          Center(
            child: Badge(
              label: Text('1'),
              backgroundColor: Colors.green,
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            // name
            TextField(
              decoration: const InputDecoration(hintText: 'Name'),
              onChanged: (String name) {
                getName(name);
              },
            ),
            // desc
            TextField(
              decoration: const InputDecoration(hintText: 'Description'),
              onChanged: (String description) {
                getDescription(description);
              },
            ),
            // price
            TextField(
              decoration: const InputDecoration(hintText: 'Price'),
              onChanged: (price) {
                getPrice(price);
              },
            ),

            //Row padding
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      createData();
                    },
                    child: const Text('Create'),
                  ),
                  TextButton(
                    onPressed: () {
                     // readData();
                    },
                    child: const Text('Read'),
                  ),
                  TextButton(
                    onPressed: () {
                    //  updateData();
                    },
                    child: const Text('Update'),
                  ),
                  TextButton(
                    onPressed: () {
                    //  deleteData();
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ),
            const Divider(),

            const Row(
              children: [
                Expanded(child: Text('Name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),)),
                Expanded(child: Text('Name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),)),
                Expanded(child: Text('Name',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),)),
              ],
            ),
            FutureBuilder<List<ModelDash>>(
              future: getreadAllData(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return  Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child:  Text(snapshot.data![index].name.toString()),
                        ),
                             Expanded(
                                child: Text(snapshot.data![index].description.toString()),
                            ),
                             Expanded(
                        child: Text(snapshot.data![index].price.toString()),
                           ),

                          ],
                        );
                      },
                  );
                },),
          ],
        ),
      ),
    );
  }

  void getName(String name) {
    this.name = name;
  }

  void getPrice(String price) {
    this. price = double.parse(price.toString());
  }

  void getDescription(String description) {
    this.description = description;
  }
  //
  // void createData() {
  //
  //  var dbHelper = DBHelper();
  //  var dish = ModelDash(name, description, price);
  //  dbHelper.createData(dish);
  // }
  // void deleteData() {
  //    var dbHelper = DBHelper();
  //    dbHelper.deleteData(name);
  //
  // }
  // void readData() {
  //   Future<ModelDash> dish = DBHelper().readData(name);
  //   dish.then((value) {
  //     print(" '${value.name}', '${value.description}', '${value.price}'");
  //   },);
  // }


  //
  // void updateData() {
  //
  // var dbHelper = DBHelper();
  // var dish  = ModelDash(name, description, price);
  // dbHelper.updateData(dish);
  //
  //
  // }
  //
  // Future<List<ModelDash>> getreadAllData() async
  // {
  //
  //   var dbHelper = DBHelper();
  //
  //   Future<List<ModelDash>> dishesList = dbHelper.readAllData();
  //
  //   return dishesList;
  //
  // }

}
