import 'package:flutter/material.dart';

import 'package:program12/add_task.dart';
import 'package:program12/sql_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool light = true;
  bool _switchValue = false;
  final TextEditingController _taskTitleController = TextEditingController();

  void onSwitchChanged(bool value) async {
    setState(() {
      _switchValue = value;
    });
    print("valueeeeeeeeeeeeeeeeeeeeeeeeeeeee${value}");
    print("switch valeeeeeeeeeeeeee${_switchValue}");
    if (_switchValue == true) {
      _showCompletedTask();
    } else {
      _refreshJournals();
    }

    print(_journals);
  }

  late String _taskDate;

  DateTime date = DateTime.now();

  void selectedDatePicker() async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1999),
        lastDate: DateTime(2300));
    if (datePicker != null && datePicker != date) {
      setState(() {
        date = datePicker;
        _taskDate = date.toString();
        print("heeeeeeelllllllloooooooooooooooo${_taskDate}");
      });
    }
  }

  void _showCompletedTask() async {
    print("hello");
    light = true;
    final data = await SQLHelper.getItem("true");
    setState(() {
      _journals = data;
    });
  }

  Future<void> _addItem() async {
    print("add item");
    await SQLHelper.createItem(_taskTitleController.text, _taskDate, "false");
    print("textttttttttttttttt: ${_taskTitleController.text}");
    print("after add item");
    _refreshJournals();
    // _refreshJournals();
    print("numberrrrr of itemss : ${_journals.length}");
  }

  List<Map<String, dynamic>> _journals = [];

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
    });
    print(_journals);
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    print(".. number of items ${_journals.length}");
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("deleted successfully")));
    _refreshJournals();
    setState(() {});
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(id, "true");
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("program 12"),
        actions: [
          Switch(
            value: _switchValue,
            activeColor: Colors.green,
            onChanged: onSwitchChanged,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _journals.length,
              itemBuilder: (context, index) {
                print("this is lengthhhhhhhhhhhhhhhhhhhhhhh");
                print(_journals.length);
                return Card(
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        _refreshJournals();
                      },
                      icon: Icon(Icons.refresh),
                    ),
                    title: Text(
                      _journals[index]['name'] ?? "no data",
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text("${_journals[index]['date']}" ?? "no data"),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                _updateItem(_journals[index]['id']);
                              },
                              icon: (_journals[index]['complete'] == "true")
                                  ? const Icon(Icons.done)
                                  : const Icon(Icons.square_outlined)),
                          IconButton(
                              onPressed: () {
                                _deleteItem(_journals[index]['id']);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                    // title: Text("hello"),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // height: 100,
                  width: 300,
                  child: TextField(
                    controller: _taskTitleController,
                    decoration: InputDecoration(hintText: "Enter Task"),
                  ),
                ),
                Container(
                  width: 70,
                  child: IconButton(
                      onPressed: () {
                        selectedDatePicker();
                      },
                      icon: const Icon(
                        Icons.date_range,
                        size: 35,
                      )),
                )
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _addItem();
              },
              child: Text("saved")),
        ],
      ),
    );
  }
}
