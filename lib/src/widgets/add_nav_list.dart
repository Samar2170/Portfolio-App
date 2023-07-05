import 'package:flutter/material.dart';

import '../data.dart';

class AddNavList extends StatelessWidget {
  final List<NavOption> navOptions;
  final ValueChanged<NavOption>? onTap;

  const AddNavList({
    required this.navOptions,
    this.onTap,
    super.key
    });

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: navOptions.length,
    itemBuilder: (context, index) => ListTile(
      title: Text(navOptions[index].name),
      onTap: onTap !=null ? () => onTap!(navOptions[index]) :null,
    )
  );
}