import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../models/submenu.dart';
import 'submenu_widget.dart';

class SubMenu extends StatelessWidget {
  final List<SubMenuItem> items = [
    SubMenuItem(label: "Category", icon: Iconsax.category),
    SubMenuItem(label: "Flight", icon: Iconsax.airplane),
    SubMenuItem(label: "Bill", icon: Iconsax.clipboard_text),
    SubMenuItem(label: "Data Plan", icon: Iconsax.global),
    SubMenuItem(label: "Top Up", icon: Iconsax.coin4),
  ];
  SubMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(5, (int index) {
          var item = items[index];
          return SubMenuTile(
            label: item.label!,
            icon: item.icon!,
          );
        }));
  }
}
