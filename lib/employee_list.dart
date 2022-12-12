// import 'package:flutter/material.dart';
// import './dbhelper.dart';
// import 'models/sura_names.dart';
//
//
//
// class EmployeeListPage extends StatefulWidget {
//   const EmployeeListPage({super.key});
//
//   @override
//   State<EmployeeListPage> createState() => _EmployeeListPageState();
// }
//
// class _EmployeeListPageState extends State<EmployeeListPage> {
//
//   List<SuraNames> allSurahs = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
//
//   void getData() async {
//   //  var dbHelper = DBHelper();
//   allSurahs = await DBHelper().getSuraNames();
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Employee Names'),
//       ),
//       body: ListView.builder(
//     padding: const EdgeInsets.all(8),
//     itemCount: allSurahs.length,
//     itemBuilder: (BuildContext context, int index) {
//
//               return Column(
//                 children: [
//                   Text(
//                     allSurahs[index].suraNumber.toString(),
//                   ),
//                   Text(
//                     allSurahs[index].tamilName,
//                   ),
//                   Text(
//                     allSurahs[index].totalVerses.toString(),
//                   ),
//                 ],
//               );
//             }),
//       );
//   }
// }
