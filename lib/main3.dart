// import 'package:flutter/material.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late String _selectedUser;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Navigator(
//         pages:[
//           MaterialPage(child: UsersView(
//             didSelectUser: (user) {
//               setState(() {
//                 _selectedUser = user;
//               });
//             },
//           )),
//           if (_selectedUser !=null) 
//           MaterialPage(child: UserDetailsView(user: _selectedUser)),
//         ],
//         onPopPage: (route, result) {
//           return route.didPop(result);
//         },
//       ),
//     );
//   }
// }


// class UsersView extends StatelessWidget {
//   final _users = ['Kyle', 'Adriana', 'Andrew','Xavier', 'Mya'];

//   final ValueChanged didSelectUser;

//   UsersView({Key? key, required this.didSelectUser});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Users'),
//       ),
//       body: ListView.builder(
//         itemCount: _users.length,
//         itemBuilder: (context, index) {
//           final user = _users[index];
//           return Card(
//             child: ListTile(
//               title: Text(user),
//               onTap: () => didSelectUser(user),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class UserDetailsView extends StatelessWidget {
//   static const valueKey = ValueKey('UserDetailsView');
//   String user;

//   UserDetailsView({Key? key, required this.user}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(user),
//       ),
//       body: Center(
//         child: Text(user),
//       ),
//     );
//   }
// }