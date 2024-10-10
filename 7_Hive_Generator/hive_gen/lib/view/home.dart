import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_gen/models/glocery_model.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<GloseryModel>? gloseryBox;

  @override
  void initState() {
    // TODO: implement initState

    log(gloseryBox.runtimeType.toString());
    log(gloseryBox.hashCode.toString());
    gloseryBox = Hive.box<GloseryModel>(
        'grocery_list'); //here we pass box to the variable the box is opend at time of runApp is calling so here only geting the box
    //supose the box is not found then the it willsow the error
    log("After initialization of box");
    log(gloseryBox.runtimeType.toString());
    log(gloseryBox.hashCode.toString());

    /*
    output is: 
      [log] Null
      [log] 2011
      [log] After initialization of box
      [log] BoxImpl<GloseryModel>
      [log] 1053652400
    */



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController itemTEC = TextEditingController();
    final TextEditingController quantityTEC = TextEditingController();
    final TextEditingController complitedTEC = TextEditingController();
    final TextEditingController dateTEC = TextEditingController();


    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: gloseryBox!.listenable(),
          builder: (context, Box<GloseryModel> items, _) {
            
            if(items.isEmpty){
              return Center( 
                child: Text("No items found"),
              );
            }

            //this will get the keys form the Hive box and then we was type canst in int then
            List<int> keys = items.keys.cast<int>().toList();

            return ListView.builder(
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  final int key =
                      keys[index]; //get the current index key and then
                  //geting the current index value form theat key
                  final GloseryModel? _item = items.get(key);

                  return ListTile(
                    title: Text( _item!.item),
                    trailing: Text("quantity: " +_item.quantity),
                    subtitle: Text(_item.date),
                  );
                });
          }),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              showDialog(context: context, builder: (context)=> AlertDialog( 

              title: Column(

                
                children: [ 

                  TextField(controller: itemTEC, decoration: InputDecoration(hintText: 'Item')),
                  TextField(controller: quantityTEC, decoration: InputDecoration(hintText: 'Quantity')),
                  TextField(controller: complitedTEC, decoration: InputDecoration(hintText: 'Completed')),
                  TextField(controller: dateTEC, decoration: InputDecoration(hintText: 'Date')),
                ],


              ),
              actions: [ 
                MaterialButton(onPressed: (){

                  gloseryBox!.add(
                    GloseryModel(quantity: quantityTEC.text, date: dateTEC.text, completd: bool.parse(complitedTEC.text), item: itemTEC.text)
                  );
                },
                
                child: Text(
                  "Add Glosary"
                ),
                
                )
              ],
                
              ));
            },
            child: Icon(Icons.add),
          ),
    );
  }
}
