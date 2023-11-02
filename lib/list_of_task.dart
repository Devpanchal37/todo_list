// import 'package:flutter/material.dart';
//
// import 'package:program12/add_task.dart';
// import 'package:program12/sql_helper.dart';
//
// class ShowListOfStudent extends StatefulWidget {
//   const ShowListOfStudent({super.key});
//
//   @override
//   State<ShowListOfStudent> createState() => _ShowListOfStudentState();
// }
//
// class _ShowListOfStudentState extends State<ShowListOfStudent> {
//   List<Map<String, dynamic>> _journals = [];
//   bool _isLoading = true;
//
//   void _refreshJournals() async {
//     final data = await SQLHelper.getItems();
//     setState(() {
//       _journals = data;
//       _isLoading = false;
//     });
//   }
//
//   void _deleteItem(int id) async {
//     await SQLHelper.deleteItem(id);
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text("deleted successfully")));
//     _refreshJournals();
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _refreshJournals();
//     print(".. number offffff items ${_journals.length}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("List of students"),
//       ),
//       body: ListView.builder(
//         shrinkWrap: true,
//         itemCount: _journals.length,
//         itemBuilder: (context, index) {
//           print("this is lengthhhhhhhhhhhhhhhhhhhhhhh");
//           print(_journals.length);
//           return Card(
//             child: ListTile(
//               leading: const Icon(Icons.people),
//               title: Text(_journals[index]['name'] ?? "no data"),
//               subtitle: Row(
//                 children: [
//
//                   Text("Add: ${_journals[index]['date']}" ?? "no data")
//                 ],
//               ),
//               trailing: SizedBox(
//                 width: 100,
//                 child: Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     AddStudent(id: _journals[index]['id']),
//                               ));
//                         },
//                         icon: const Icon(Icons.edit)),
//                     IconButton(
//                         onPressed: () {
//                           _deleteItem(_journals[index]['id']);
//                           setState(() {});
//                         },
//                         icon: const Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                         ))
//                   ],
//                 ),
//               ),
//               // title: Text("hello"),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
