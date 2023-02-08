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
            Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 3)),
            child: Row(children: [
            Icon(Icons.home),
            SizedBox(width: 15,),
            Text("Página inicial"),
              ],),
          ),)
          ],
          ),
        ));
  }
}
