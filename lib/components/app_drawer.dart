import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/core/auth/auth_service.dart';

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
          Divider(),
          Expanded(child: Container()),
          Divider(),
          TextButton(onPressed: (){
            AuthService().logout();
          }, child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.exit_to_app),
            SizedBox(width: 5,),
            Text("Sair")
          ],))
        ],
      ),
    ));
  }
}
