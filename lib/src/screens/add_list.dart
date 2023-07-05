import 'package:flutter/material.dart';
import 'package:portfolio_app/src/widgets/add_nav_list.dart';
import '../data.dart';

class AddListScreen extends StatefulWidget {

  const AddListScreen({super.key});

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: TabBarView(
        children: [
          AddNavList(navOptions: navOptions.where((navOption) => navOption.navCategory.category == 'add').toList()),
        ],
      )
    );
  }
}