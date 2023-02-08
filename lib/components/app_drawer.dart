import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(children: const [
                Icon(Icons.home),
                SizedBox(width: 20,),
                Text("Página Inicial"),
              ]),
            ),
          ),
          Divider()
        ],
      ),
    ));
  }
}
