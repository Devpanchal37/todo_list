import 'package:flutter/material.dart';
import 'package:program12/sql_helper.dart';

class AddStudent extends StatefulWidget {
  final int? id;
  final void callBack;

  const AddStudent({super.key, this.id, required this.callBack});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  // final TextEditingController _taskTitleController = TextEditingController();
  // final TextEditingController _taskDateController =
  // TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print("idddddddddddddddddddd ${widget.id}");
  //   _refreshJournals();
  //
  //   // _chechForEdit(widget.id);
  // }

  // Future<void> _addItem() async {
  //   print("add item");
  //   await SQLHelper.createItem(_taskTitleController.text,
  //       _taskDate);
  //   print("textttttttttttttttt: ${_taskTitleController.text}");
  //   print("after add item");
  //   widget.callBack;
  //   // _refreshJournals();
  //   print("numberrrrr of itemss : ${_journals.length}");
  //
  // }

  List<Map<String, dynamic>> _journals = [];

  // bool _isLoading = true;

  // void _refreshJournals() async {
  //   final data = await SQLHelper.getItems();
  //   setState(() {
  //     _journals = data;
  //     // _isLoading = false;
  //   });
  //   print("numberrrrr of itemss secondddddddddd : ${_journals.length}");
  //
  //   print(_journals);
  // }

// late String _taskDate ;
//   DateTime date = DateTime.now();
//
//   void selectedDatePicker() async {
//     DateTime? datePicker = await showDatePicker(
//         context: context,
//         initialDate: date,
//         firstDate: DateTime(1999),
//         lastDate: DateTime(2300));
//     if (datePicker != null && datePicker != date) {
//       setState(() {
//         date = datePicker;
//         _taskDate = date.toString();
//         print("heeeeeeelllllllloooooooooooooooo${_taskDate}");
//       });
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Container(
        //       height: 100,
        //       width: 200,
        //       child: TextField(
        //         controller: _taskTitleController,
        //
        //       ),
        //     ),
        //     Container(
        //       width: 70,
        //       child: IconButton(
        //           onPressed: () {
        //             selectedDatePicker();
        //           },
        //           icon: const Icon(Icons.date_range)),
        //     )
        //   ],
        // ),
        // ElevatedButton(onPressed: () {_addItem();}, child: Text("saved")),
        // ElevatedButton(onPressed: () {_refreshJournals();}, child: Text("save")),

        // Row(
        //   children: [
        //     TextField(
        //       controller: _studentNameController,
        //       decoration: const InputDecoration(hintText: "Student Name"),
        //     ),
        //     TextField(
        //       controller: _studentEnrollmentController,
        //       decoration: const InputDecoration(hintText: "Roll No."),
        //     ),
        //     TextFormField(
        //       controller: _studentAddressController,
        //       decoration: const InputDecoration(hintText: "Address"),
        //     ),
        //     Container(
        //       width: 200,
        //       child: ElevatedButton(
        //           onPressed: () {
        //             if (widget.id == null) {
        //               _addItem();
        //             }
        //             // _submitForm(widget.id);
        //             Navigator.pop(context);
        //           },
        //           child: const Text("Save Student Data")),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
