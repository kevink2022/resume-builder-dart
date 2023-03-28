import 'package:flutter/material.dart';
import 'package:resume_builder/viewmodels/manager.dart';
import 'package:resume_builder/views/resume_creation_view.dart';

void main() {
  final manager = Manager();
  //manager.loadResume(); // Loads the resume data

  runApp(MyApp(manager: manager));
}

class MyApp extends StatelessWidget {
  final Manager manager;

  MyApp({required this.manager});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResumeCreationView(manager: manager),
    );
  }
}




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/services.dart';
// import 'dart:io';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) 
//   {
//     return MaterialApp(
//       title: 'Resume Builder',
//       darkTheme: ThemeData.dark(),
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: MyHomePage(title: 'Resume Builder'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String jsonData = '';

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData().then((loadedData) {
//       setState(() {
//         jsonData = loadedData;
//       });
//     });
//   }

//   Future<String> _loadUserData() async {
//     return await rootBundle.loadString('user_data/user_data.json');
//   }

//   bool _showExperience = true;
//   Map<String, bool> _checkedJobs = {};
//   Map<String, Map<String, bool>> _checkedBullets = {};

//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> data = json.decode(jsonData);
//     List<dynamic> experience = data['experience'];
//     // List<dynamic> jobs = data['jobs'];

//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: ListView(
//         children: [
//           CheckboxListTile(
//             title: Text("Experience"),
//             value: _showExperience,
//             onChanged: (bool? value) {
//               setState(() {
//                 _showExperience = value!;
//                 _checkedJobs = {};
//                 _checkedBullets = {};
//               });
//             },
//           ),
//           if (_showExperience)
//             ...experience.map((job) => _buildJob(job, 'experience')).toList(),
//           // if (_showExperience)
//           //   ...jobs.map((job) => _buildJob(job, 'jobs')).toList(),
//         ],
//       ),
//     );
//   }

//   Widget _buildJob(dynamic job, String category) {
//     String title = job['title'];
//     String employer = job['employer'];
//     String startDate = job['start_date'];
//     String endDate = job['end_date'];
//     String location = job['location'];
//     List<dynamic> bullets = job['bullets'];

//     String jobKey = '$category-$title';

//     return Container(
//       margin: EdgeInsets.only(left: 24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CheckboxListTile(
//             title: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: '$title, ',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),

//                   TextSpan(text: '$location'),
//                 ],
//               ),
//             ),
//             subtitle: Text('$startDate - $endDate'),
//             value: _checkedJobs[jobKey] ?? false,
//             onChanged: (bool? value) {
//               setState(() {
//                 _checkedJobs[jobKey] = value!;
//                 if (!value) {
//                   _checkedBullets[jobKey] = {};
//                 } else {
//                   _checkedBullets[jobKey] = {};
//                 }
//               });
//             },
//           ),
//           if (_checkedJobs[jobKey] == true)
//             ...bullets.expand((bulletMap) {
//               return bulletMap.entries.map((entry) {
//                 String bulletKey = '$jobKey-${entry.key}';
//                 return Container(
//                   margin: EdgeInsets.only(left: 48.0),
//                   child: CheckboxListTile(
//                     title: Text(entry.value),
//                     value: _checkedBullets[jobKey]?[bulletKey] ?? false,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         _checkedBullets[jobKey]![bulletKey] = value!;
//                       });
//                     },
//                   ),
//                 );
//               });
//             }).toList(),
//         ],
//       ),
//     );
//   }
// }




// // void main() {
// //   Manager manager = Manager();
// //   // Use manager to access and manage checked states in your app
// // }
