import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  List<String> _listOFValues = [];
  List<String> _listOfFethedValues = [];

  final TextEditingController _controller = TextEditingController();

  Future<void> setValueLocally() async {
    SharedPreferences _sharedPreferences = await sharedPreferences;
    bool isStored =
        await _sharedPreferences.setStringList("valuesList", _listOFValues);  
    log(
      "value are stored or not : $isStored",
    );
  }

  Future<void> feathValuesFormLocalStorage() async {
    SharedPreferences _sharedPreferences = await sharedPreferences;
    List<String> _list = _sharedPreferences.getStringList("valuesList")!;
    log(_list.toString());
    setState(() {
      _listOfFethedValues = _list;
    });
  }

  @override
  void initState() {
    feathValuesFormLocalStorage(); // check the out put
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "Enter the value that you have store locally"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  _listOFValues.add(_controller.text.trim());
                  await setValueLocally();
                  feathValuesFormLocalStorage();
                }
                _controller.clear();
              },
              child: Text("Save"),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: _listOfFethedValues.length,
                itemBuilder: (context, index) =>
                    ActionChip(label: Text(_listOfFethedValues[index])))
          ],
        ),
      ),
    );
  }
}
