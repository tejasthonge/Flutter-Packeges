import 'dart:developer';
import 'dart:io';

import 'package:_0_curd_oprations/view/histry_page.dart';
import 'package:_0_curd_oprations/view/image_pic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box? _todosBox;
  Box? todoHoistryBox;
  Box? userInfoBox;
  File? profilePic;
  var userInfoKey;
  final TextEditingController _todoTEC = TextEditingController();

  storeProfilePic({String? picPath}) {
     if (picPath != null) {
      userInfoBox!.put(
        'profilePic',
        picPath,
      );
      setState(() {
                  var profilePicPath = userInfoBox!.get("profilePic");
                  profilePic = File(profilePicPath);
      });

    }



  
  }

  @override
  void initState() {
    super.initState();
    //open box will open the bax we have to pass the name of the box
    // if the box does not exist, it will be created automatically

    Hive.openBox("todos_box").then((Box box) async {
      //after the box is created
      // we will the then assinge the opend box of name todos_box to the _todosBox instance
      setState(() {
        _todosBox = box;
      });
    });

    Hive.openBox("todo_hoistry_box").then((Box box) {
      setState(() {
        todoHoistryBox = box;
      });
    });

    Hive.openBox("userinfo_box").then((Box box) {
      setState(() {
        userInfoBox = box;
        var profilePicPath = userInfoBox!.get("profilePic");
        profilePic = File(profilePicPath);
        log(profilePic.toString());
        log(box.keys.length.toString());
      });
    });
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight,
        leading: GestureDetector(
          onTap: () async {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: CircleAvatar(
                        radius: 50,
                          backgroundImage: profilePic != null
                              ? FileImage(profilePic!,scale: 0.5                              
                              )
                              : null,
                          child:
                              profilePic == null ? Icon(Icons.person) : null),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        MaterialButton(
                          color: Colors.red.shade900,
                          onPressed: () async {
                            //  log(profilePic.toString());

                            XFile? selectedPic =
                                await ImageService.pickGalleryImage();
                            //  profilePic =File(selectedPic!.path);
                            if (selectedPic != null) {
                              storeProfilePic(picPath: selectedPic.path);
                            }
                            //  log(profilePic.toString());
                          },
                          child: Text(
                            "Update Picture",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ));
          },
          child: Padding(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              backgroundImage:
                  profilePic != null ? FileImage(profilePic!) : null,
              child: profilePic == null ? Icon(Icons.person) : null,
            ),
          ),
        ),
        title: const Text(
          "Note it!",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red.shade900,

        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => HistryPage()));
              },
              icon: Icon(
                Icons.history_toggle_off,
                color: Colors.white,
              ))
        ],
      ),
      body: _buildHomeUI(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
                onPressed: () {
                  var todoKey = _todosBox!.keys.toList();
                  for (int i = 0; i < _todosBox!.length; i++) {
                    var todoUp = _todosBox!.get(todoKey[i]);
                    todoUp["deletedTime"] = DateTime.now();
                    todoHoistryBox!.add(todoUp);
                  }
                  _todosBox!.clear();
                },
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.red.shade900,
                )),
            FloatingActionButton(
              onPressed: () => _displayTextInputDialog(context),
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 74, 139, 76),
                weight: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeUI() {
    if (_todosBox == null) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.red.shade900,
        ),
      );
    }
    return ValueListenableBuilder(
        valueListenable: _todosBox!.listenable(),
        builder: (context, box, widget) {
          final todosKey = box.keys.toList();

          return ListView.builder(
              itemCount: todosKey.length,
              itemBuilder: (context, index) {
                var todo = _todosBox!.get(todosKey[index]);

                var title = todo['content'];
                var time = todo['time'];
                var isDone = todo['isDone'];

                return Dismissible(
                  key: Key(todo.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      box.delete(todosKey[index]);
                    });
                    if (todoHoistryBox != null) {
                      todo['deletedTime'] = DateTime.now();

                      todoHoistryBox!.add(todo);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Deleted: $title",
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: isDone == true
                                ? const Color.fromARGB(113, 244, 67, 54)
                                : Colors.red.shade900,
                            borderRadius: BorderRadius.circular(7)),
                        child: ListTile(
                            title: Text(
                              title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red.shade900),
                                  color: isDone == true
                                      ? Colors.green
                                      : const Color.fromARGB(
                                          255, 194, 191, 191),
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  color: isDone == true
                                      ? Colors.red.shade900
                                      : Colors.amber.shade800,
                                  onPressed: () {
                                    todo["isDone"] = !isDone;
                                    box.put(todosKey[index], todo);
                                  },
                                  icon: Icon(isDone == true
                                      ? Icons.done
                                      : Icons.run_circle)),
                            )),
                      ),
                      Positioned(
                        top: 10,
                        left: 5,
                        child: Container(
                            padding: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                color: isDone == true
                                    ? Colors.green
                                    : Colors.amber.shade700,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            child: Text(
                              isDone == true ? "Done" : "Pending",
                              style: TextStyle(
                                  color:
                                      // isDone == true?
                                      Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add Todos"),
            content: TextFormField(
              controller: _todoTEC,
              decoration: const InputDecoration(hintText: "Todo..."),
            ),

            actions: [
              MaterialButton(
                color: Colors.red.shade900,
                onPressed: () {
                  _todosBox!.add({
                    "content": _todoTEC.text.trim(),
                    "time": DateTime.now(),
                    "isDone": false
                  });

                  _todoTEC.clear();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
            // actions: [],
          );
        });
  }
}
