import 'package:flutter/material.dart';

import '../data.dart';

class PortfolioNavList extends StatefulWidget {
  final List<NavOption> navOptions;
  final ValueChanged<NavOption>? onTap;

  const PortfolioNavList({
    required this.navOptions,
    this.onTap,
    super.key
    });

  @override
  State<PortfolioNavList> createState() => _PortfolioNavListState();
}

class _PortfolioNavListState extends State<PortfolioNavList> {
  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: widget.navOptions.length,
    itemBuilder: (context, index) => ListTile(
      title: Text(widget.navOptions[index].name),
      onTap: widget.onTap !=null ? () => widget.onTap!(widget.navOptions[index]) :null,
    )
  );
}