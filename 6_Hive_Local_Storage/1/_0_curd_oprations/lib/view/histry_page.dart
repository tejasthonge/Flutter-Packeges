import 'dart:developer';

import 'package:_0_curd_oprations/view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HistryPage extends StatefulWidget {
  const HistryPage({super.key});

  @override
  State<HistryPage> createState() => _HistryPageState();
}

class _HistryPageState extends State<HistryPage> {
  late Box? todoHoistryBox;

  convertDateTime(DateTime dateTime) {
    String formattedDate = DateFormat('d MMM y').format(dateTime);
    return formattedDate;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.openBox("todo_hoistry_box").then((Box box) {
      setState(() {
        todoHoistryBox = box;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.home, color: Colors.white)),
        title: const Text(
          "History",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildHistroyUi(),
    );
  }

  Widget _buildHistroyUi() {
    if (todoHoistryBox == null) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.red.shade900,
        ),
      );
    }
    return ValueListenableBuilder(
        valueListenable: todoHoistryBox!.listenable(),
        builder: (context, box, widget) {
          var keys = box.keys.toList();

          return ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index) {
                var hTodo = box.get(keys[index]);

                String title = hTodo["content"];
                bool isDone = hTodo["isDone"];
                DateTime createdAt = hTodo["time"];
                DateTime deletedAt = hTodo["deletedTime"];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: const Color.fromARGB(59, 158, 158, 158)),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(178, 136, 61, 61)),
                          color: isDone == true
                              ? const Color.fromARGB(255, 99, 172, 101)
                              : const Color.fromARGB(255, 194, 191, 191),
                          shape: BoxShape.circle),
                      child: IconButton(
                          padding: const EdgeInsets.all(0),
                          color: isDone == true
                              ? const Color.fromARGB(255, 228, 80, 80)
                              : const Color.fromARGB(255, 203, 173, 134),
                          onPressed: () {},
                          icon: Icon(
                              isDone == true ? Icons.done : Icons.run_circle)),
                    ),
                    title: Text(
                      title,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 145, 133, 133),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Deleted: ${convertDateTime(deletedAt)}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                          Text(
                            "Created: ${convertDateTime(createdAt)}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
